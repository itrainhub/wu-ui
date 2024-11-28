import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { noop } from '../../utils/Common'
import { WuButton } from '../button'
import { componentUtils } from '@kit.ArkUI'

@Component
export struct WuSignature {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  // 画笔颜色
  @Prop penColor: string = '#000000'
  // 画笔线宽
  @Prop lineWidth: number = 3
  // 背景颜色
  @Prop bgColor: string = this.theme.ghostWhite as string

  // 点击清空按钮触发
  onClear: () => void = noop
  // 点击确定按钮, 获得图片的 base64 url 字符串数据
  onSubmit: (image: string) => void = noop

  // 使用 CanvasRenderingContext2D 中的方法进行绘制
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  // Canvas id
  private canvasId: string = '__wu_canvas_' + Math.random().toString().slice(2).slice(-6).padStart(6, '0')

  // Canvas宽高
  private flag: boolean = false
  private cWidth: number =  0
  private cHeight: number = 0

  // 临时画笔x, y坐标
  private lastX: number = 0
  private lastY: number = 0

  /**
   * 绘制签名轨迹
   * @param startX
   * @param startY
   * @param endX
   * @param endY
   */
  private draw(startX: number, startY: number, endX: number, endY: number) {
    this.context.moveTo(startX, startY)
    this.context.lineTo(endX, endY)
    this.context.stroke()
  }

  /**
   * 填充背景颜色
   */
  fillBgColor() {
    if (this.bgColor !== this.theme.ghostWhite) {
      this.context.fillStyle = this.bgColor
      this.context.fillRect(0, 0, this.cWidth, this.cHeight)
    }
  }

  /**
   * 清空签名
   */
  handleClear = () => {
    this.context.clearRect(0, 0, this.cWidth, this.cHeight)
    this.fillBgColor()
    this.onClear()
  }

  build() {
    Column({space: 8}) {
      Canvas(this.context)
        .id(this.canvasId)
        .width('100%')
        .layoutWeight(1)
        .backgroundColor(this.bgColor)
        .onAppear(() => {
          // 设置线宽与画笔颜色
          this.context.lineWidth = this.lineWidth
          this.context.strokeStyle = this.penColor
          // 获取canvas宽高
          const size = componentUtils.getRectangleById(this.canvasId).size
          this.cWidth = px2vp(size.width)
          this.cHeight = px2vp(size.height)
          // 填充背景颜色
          this.fillBgColor()
        })
        .gesture(
          PanGesture({distance: 1})
            .onActionStart(event => {
              this.lastX = event.fingerList[0].localX
              this.lastY = event.fingerList[0].localY
              this.context.beginPath()
            })
            .onActionUpdate(event => {
              const x: number = event.fingerList[0].localX
              const y: number = event.fingerList[0].localY
              this.draw(this.lastX, this.lastY, x, y)
              this.lastX = x
              this.lastY = y
            })
            .onActionEnd(() => {
              this.context.closePath()
            })
        )

      Row({space: 8}) {
        WuButton({
          text: '清空',
          btnSize: 'small',
        })
          .onClick(this.handleClear)
        WuButton({
          text: '确认',
          btnSize: 'small',
          type: 'primary',
        })
          .onClick(() => {
            this.onSubmit(this.context.toDataURL())
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .height('100%')
  }
}