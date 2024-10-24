import { image } from '@kit.ImageKit'
import { matrix4 } from '@kit.ArkUI'
import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { WuPanOffset, WuPinchScale } from './types'
import { runWithAnimation } from '../../utils/Common'
import WuGlobalData from '../../utils/GlobalData'

/**
 * 加载资源文件，返回 ArrayBuffer
 * @param ctx
 * @param url
 * @returns
 */
function loadResource(ctx: Context, url: Resource) {
  const res = ctx.resourceManager.getMediaContentSync(url)
  return res.buffer
}

/**
 * 加载网络图片，转换为 ArrayBuffer
 * @param url
 * @returns
 */
function loadImage(url: string) {
  return http.createHttp().request(url)
    .then((data: http.HttpResponse) => {
      if (data.responseCode >= 200 && data.responseCode < 300) {
        return data.result as ArrayBuffer
      }
      return null
    })
    .catch((error: BusinessError) => {
      console.error(`http reqeust failed with Code: ${error.code}, message: ${error.message}`)
      return null
    })
}

/**
 * 图像预览组件
 */
@Component
export struct ImageViewer {
  @Prop imageResource: ResourceStr = '' // 当前图片资源，可选 Resource 资源与网络图片地址 url 字符串
  @Prop bgColor: ResourceColor = Color.Black // 背景颜色

  @State scaleInfo: WuPinchScale = new WuPinchScale() // 缩放信息
  @State offsetInfo: WuPanOffset = new WuPanOffset() // 拖动偏移量信息
  @State matrixScale: matrix4.Matrix4Transit = matrix4.identity().copy() // 单位矩阵，用于图像缩放
  @State matrixTranslate: matrix4.Matrix4Transit = matrix4.identity().copy() // 单位矩阵，用于图像平移
  @State imagePixelMap?: image.PixelMap = undefined // 当前图片位图信息，用于Image组件显示
  @State fitDirection?: 'width' | 'height' = 'width' // 表示当前图片是根据宽度适配还是高度适配
  @State imageFitSize: image.Size = { width: 0, height: 0 } // 图片适配大小，即，与屏幕大小最适配的显示大小

  private imageOriginalRatio: number = 1 // 图片原始宽高比

  private context: Context = getContext(this) // 上下文

  aboutToAppear(): void {
    this.initImageInfo()
  }

  /**
   * 根据图片宽高比及窗口大小计算图片最合适的适配宽高，即，图片最适配屏幕的大小
   * @returns image.Size
   */
  calcImageDefaultSize(): image.Size {
    let width = 0
    let height = 0
    const winWidth = WuGlobalData.screenWidth
    const winHeight = WuGlobalData.screenHeight
    if (this.imageOriginalRatio > winWidth / winHeight) {
      // 图片宽高比大于屏幕宽高比，图片默认以屏幕宽度进行显示
      width = winWidth
      height = winWidth / this.imageOriginalRatio
    } else {
      // 图片以屏幕高度进行显示
      height = winHeight
      width = winHeight * this.imageOriginalRatio
    }
    return { width, height }
  }

  /**
   * 根据图片大小和屏幕大小计算图片放大适配屏幕进行显示的缩放倍率(以短边显示为最佳)
   * @returns：缩放倍率
   */
  calcFitScaleRatio(): number {
    let ratio: number = 1.0
    const winWidth = WuGlobalData.screenWidth
    const winHeight = WuGlobalData.screenHeight
    if (winWidth > this.imageFitSize.width) {
      ratio = winWidth / this.imageFitSize.width
    } else {
      ratio = winHeight / this.imageFitSize.height
    }
    return ratio
  }

  /**
   * 初始化当前图片的相关信息
   */
  async initImageInfo() {
    // 获取图像资源的 ArrayBuffer 缓冲数据
    const buffer = typeof this.imageResource === 'string'
      ? await loadImage(this.imageResource as string)
      : loadResource(this.context, this.imageResource)
    // 根据 ArrayBuffer 创建图片源对象
    const imageSource: image.ImageSource = image.createImageSource(buffer)
    if (!imageSource) {
      return
    }
    // 获取图像基本信息并处理
    imageSource.getImageInfo(0, (err: BusinessError, data: image.ImageInfo) => {
      if (err) {
        console.error(`[error][getImageInfo]${err.message}`)
        return
      }
      // 原始宽高比例
      this.imageOriginalRatio = data.size.width / data.size.height
      // 计算最适配的图像宽高
      this.imageFitSize = this.calcImageDefaultSize()
      // 适配方向
      this.fitDirection = this.imageFitSize.width === WuGlobalData.screenWidth ? 'width' : 'height'
      // 最大缩放系数更新
      this.scaleInfo.maxScaleValue += this.calcFitScaleRatio()
    })
    // 位图数据
    imageSource.createPixelMap().then((data: image.PixelMap) => {
      this.imagePixelMap = data
    }).catch((err: BusinessError) => {
      console.error(`创建图像位图数据失败: ${err.message}`)
    })
    // 重置缩放与偏移位置
    this.scaleInfo.reset()
    this.offsetInfo.reset()
  }

  /**
   * 在图片消失时，将当前图片的信息设置为默认值
   */
  resetCurrentImageInfo(): void {
    this.scaleInfo.reset()
    this.offsetInfo.reset()
    this.matrixScale = matrix4.identity().copy()
  }

  build() {
    Stack() {
      Image(this.imagePixelMap)// 宽高只根据其尺寸设置一个，通过保持宽高比来设置另一个属性
        .width(this.fitDirection === 'width' ? '100%' : undefined)
        .height(this.fitDirection === 'height' ? '100%' : undefined)
        .aspectRatio(this.imageOriginalRatio)
        .objectFit(ImageFit.Cover)
        .autoResize(false)
        .transform(this.matrixScale.copy().combine(this.matrixTranslate)) // 通过matrix控制图片的缩放与平移
        .defaultFocus(true)
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
    .onBlur(() => {
      this.resetCurrentImageInfo()
    })
    .backgroundColor(this.bgColor)
    .alignContent(Alignment.Center)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    .width('100%')
    .height('100%')
    .gesture( // 手势
      GestureGroup( // 组合手势
        GestureMode.Exclusive, // 互斥
        // 双击切换图片大小
        TapGesture({ count: 2 })
          .onAction(() => {
            let fn: Function
            // 已经是放大状态下，双击缩小
            if (this.scaleInfo.scaleValue > this.scaleInfo.defaultScaleValue) {
              fn = () => {
                this.scaleInfo.reset()
                this.offsetInfo.reset()
                this.matrixScale = matrix4.identity().copy()
                this.matrixTranslate = matrix4.identity().copy()
              }
            } else { // 已经是缩小状态，双击放大
              fn = () => {
                const ratio: number = this.calcFitScaleRatio()
                this.scaleInfo.scaleValue = ratio
                this.offsetInfo.reset()
                this.matrixScale = matrix4.identity().scale({
                  x: ratio,
                  y: ratio,
                }).copy()
                this.scaleInfo.stash()
              }
            }
            runWithAnimation(fn)
          }),
        // 双指捏合缩放图片
        PinchGesture({ fingers: 2 })
          .onActionUpdate((event: GestureEvent) => {
            // 当前缩放因子
            this.scaleInfo.scaleValue = this.scaleInfo.pinchValue * event.scale
            // 缩放时不允许大于最大缩放因子，也不允许小于默认缩放因子，可添加额外缩放因子用于提升用户体验
            if (this.scaleInfo.scaleValue > this.scaleInfo.maxScaleValue * (1 + this.scaleInfo.extraScaleValue)) {
              this.scaleInfo.scaleValue = this.scaleInfo.maxScaleValue * (1 + this.scaleInfo.extraScaleValue)
            }
            if (this.scaleInfo.scaleValue < this.scaleInfo.defaultScaleValue * (1 - this.scaleInfo.extraScaleValue)) {
              this.scaleInfo.scaleValue = this.scaleInfo.defaultScaleValue * (1 - this.scaleInfo.extraScaleValue)
            }
            // matrix默认缩放中心为组件中心
            this.matrixScale = matrix4.identity().scale({
              x: this.scaleInfo.scaleValue,
              y: this.scaleInfo.scaleValue,
            }).copy()
          })
          .onActionEnd(() => {
            /**
             * 当小于默认大小时，恢复为默认大小
             */
            if (this.scaleInfo.scaleValue < this.scaleInfo.defaultScaleValue) {
              runWithAnimation(() => {
                this.scaleInfo.reset()
                this.offsetInfo.reset()
                this.matrixScale = matrix4.identity().copy()
                this.matrixTranslate = matrix4.identity().copy()
              })
            }
            // 当大于最大缩放因子时，恢复到最大
            if (this.scaleInfo.scaleValue > this.scaleInfo.maxScaleValue) {
              runWithAnimation(() => {
                this.scaleInfo.scaleValue = this.scaleInfo.maxScaleValue
                this.matrixScale = matrix4.identity().scale({
                  x: this.scaleInfo.maxScaleValue,
                  y: this.scaleInfo.maxScaleValue
                }).copy()
              })
            }
            this.scaleInfo.stash()
          }),
        // 拖动图片
        PanGesture()
          .onActionUpdate((event: GestureEvent) => {
            if (this.scaleInfo.scaleValue <= this.scaleInfo.defaultScaleValue) {
              // 默认大小下不允许移动
              return
            }
            this.offsetInfo.offsetX = this.offsetInfo.positionX + event.offsetX
            this.offsetInfo.offsetY = this.offsetInfo.positionY + event.offsetY
            this.matrixTranslate = matrix4.identity().translate({
              x: vp2px(this.offsetInfo.offsetX),
              y: vp2px(this.offsetInfo.offsetY),
            }).copy()
          })
          .onActionEnd(() => {
            this.offsetInfo.stash()
          })
      ),
    )
  }
}