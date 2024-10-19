import { toVp } from "./util"

@Component
export struct WuCircular {
  @Prop iconSize: string | number
  @Prop color: string

  private strokeWidth: number = toVp('4lpx')
  private angle: number = 0

  // 画布宽度
  private canvasWidth: number = toVp(this.iconSize)
  // 圆半径
  private radius: number = this.canvasWidth / 2 - this.strokeWidth
    // 定时器id
  private timer: number = 0
  // 圆弧角度步长
  private stepLen: number = 30
  // 圆弧角度
  private endDeg: number = 10

  // 使用 CanvasRenderingContext2D 中的方法进行绘制
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  drawCircle() {
    const centerX = this.canvasWidth / 2
    const centerY = this.canvasWidth / 2

    // 绘制旋转的圆弧边框
    const startAngle = (this.angle * Math.PI) / 180; // 将当前角度转换为弧度
    const endAngle = startAngle + Math.PI * this.endDeg / 180; // 结束角度为起始角度加上一定度数

    this.context.beginPath();
    this.context.arc(centerX, centerY, this.radius, startAngle, endAngle); // 圆弧
    this.context.strokeStyle = this.color; // 设置圆弧边框颜色
    this.context.lineWidth = this.strokeWidth; // 设置边框宽度
    this.context.lineCap = 'round'; // 设置线条的端点为圆角，增加视觉效果
    this.context.stroke(); // 绘制圆弧边框
    this.context.closePath();
  }

  draw() {
    const _draw = () => {
      this.context.clearRect(0, 0, this.canvasWidth, this.canvasWidth)
      this.endDeg += this.stepLen
      if (this.endDeg > 250 || this.endDeg < 40) {
        this.stepLen *= -1
        if (this.stepLen > 0) {
          this.angle += Math.abs(this.stepLen) - 10
        }
      }
      this.angle = (this.angle + 10 + (this.stepLen < 0 ? Math.abs(this.stepLen) : 0)) % 360

      this.drawCircle()
      this.timer = setTimeout(_draw, 50)
    }
    _draw()
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
