import { hexToRgb, toVp } from "./util";

@Component
export struct WuSpinner {
  @Prop iconSize: Length
  @Prop color: string

  private angle: number = 0; // 旋转角度

  // 画布宽度
  private canvasWidth: number = toVp(this.iconSize.toString())
  // 菊花的圈数
  private numberOfCircles: number = 12
  // 花瓣图形宽高
  private rectWidth: number = Math.round(this.canvasWidth / 12)
  private rectHeight: number = Math.round(this.canvasWidth / 6)
  // 圆的半径
  private radius: number = this.canvasWidth / 2 - this.rectHeight
  // 定时器id
  private timer: number = 0

  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  draw() {
    const _draw = () => {
      this.context.clearRect(0, 0, this.canvasWidth, this.canvasWidth)
      this.angle = (this.angle + 10) % 360
      this.drawSpinner()
      this.timer = setTimeout(_draw, 50)
    }
    _draw()
  }

  /**
   * 画菊花图
   * 角度转弧度: 180度=Math.PI弧度，则 1度=(Math.PI/180)弧度
   */
  drawSpinner() {
    const centerX = this.canvasWidth / 2
    const centerY = this.canvasWidth / 2

    for(let i = 0; i < this.numberOfCircles; i++) {
      // 当前花瓣弧度
      const currAngle = (i * (360 / this.numberOfCircles) + this.angle) * Math.PI / 180
      // 花瓣坐标
      const x = centerX + this.radius * Math.cos(currAngle)
      const y = centerY + this.radius * Math.sin(currAngle)
      // 当前花瓣透明度
      const alpha = (i + 1) / this.numberOfCircles
      // 保存当前绘制状态
      this.context.save()

      // 移动到矩形中心并旋转画布
      this.context.translate(x, y)
      this.context.rotate(currAngle)
      // 花瓣颜色
      this.context.fillStyle = `rgba(${hexToRgb(this.color)}, ${alpha})`
      // 绘制长条矩形花瓣
      this.context.fillRect(-this.rectHeight / 2, -this.rectWidth / 2, this.rectHeight, this.rectWidth)

      // 恢复到保存的状态
      this.context.restore()
    }
  }

  build() {
    Row() {
      Canvas(this.context)
        .width(this.canvasWidth)
        .aspectRatio(1)
        .onReady(() => {
          this.draw()
        })
    }
    .onDisAppear(() => {
      clearInterval(this.timer)
    })
  }
}
