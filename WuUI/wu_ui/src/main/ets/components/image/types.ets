/**
 * 预览拖动偏移量
 */
@Observed
export class WuPanOffset {
  // 当前次偏移量
  offsetX: number = 0
  offsetY: number = 0
  // 前一次偏移量
  positionX: number = 0
  positionY: number = 0

  /**
   * 重置偏移量值
   */
  reset(): void {
    this.offsetX = 0
    this.offsetY = 0
    this.positionX = 0
    this.positionY = 0
  }

  /**
   * 暂存本次偏移量以备后用(以备下次拖动手势触发使用)
   */
  stash(): void {
    this.positionX = this.offsetX
    this.positionY = this.offsetY
  }
}

/**
 * 预览缩放因子
 */
export class WuPinchScale {
  // 本次缩放因子，用于控制图片的大小显示
  scaleValue: number
  // 上次捏合完后的缩放因子
  pinchValue: number
  // 最大放大值
  maxScaleValue: number
  // 默认缩放值
  readonly defaultScaleValue: number = 1.0
  // 额外的缩放因子
  extraScaleValue: number

  constructor(scaleValue: number = 1.0, pinchValue: number = 1.0, maxScaleValue: number = 2.0, extraScaleValue: number = 0.3) {
    this.scaleValue = scaleValue
    this.pinchValue = pinchValue
    this.maxScaleValue = maxScaleValue
    this.extraScaleValue = extraScaleValue
  }

  /**
   * 重置缩放因子
   */
  reset(): void {
    this.scaleValue = this.defaultScaleValue
    this.pinchValue = this.defaultScaleValue
  }

  /**
   * 保存本次缩放因子以备后用(以备下次捏合手势触发使用)
   */
  stash(): void {
    this.pinchValue = this.scaleValue
  }
}