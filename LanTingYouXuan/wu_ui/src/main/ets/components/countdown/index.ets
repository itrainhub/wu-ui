import { formatDatetime, mill2dhms, WuCountDownTime } from "./util"
import { WuCountDownController } from './controller'
import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord } from "../../theme-chalk/types"
import { noop } from "../../utils/Common"

@Component
export struct WuCountDown {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop @Watch('onTimeChange') time: number // 倒计时毫秒
  @Prop autoStart: boolean = true // 是否自动开始倒计时
  @Prop format: string = 'DD:HH:mm:ss' // 时间格式
  @Prop millisecond: boolean = false // 是否开启毫秒级计时

  controller?: WuCountDownController // 控制器，可控制开始、暂停与重置计时

  onTimeUpdate?: (countDownTime: WuCountDownTime) => void
  onFinish: () => void = noop

  @BuilderParam customContent: () => void = this.renderCountDown

  private originalTime = this.time
  private deadline: number = 0
  private timer: number = 0

  private dhms: WuCountDownTime = mill2dhms(this.time)

  @State countDownTime: string = formatDatetime(this.dhms, this.format)

  private onTimeChange() {
    // 将毫秒转换为天时分秒数据
    this.dhms = mill2dhms(this.time)
    // 将天时分秒格式化为字符串文本
    this.countDownTime = formatDatetime(this.dhms, this.format)
    // 时间改变，触发 onTimeUpdate 回调（如果有的话）
    this.onTimeUpdate?.(this.dhms)
  }

  /**
   * 倒计时
   */
  play = () => {
    // 计算毫秒时间差
    let diff = this.deadline - Date.now()
    if (diff < 0) {
      diff = 0
    }
    this.time = diff
    // 时间差大于0则继续倒计时，否则执行 onFinish 回调
    if (diff > 0) {
      this.timer = setTimeout(this.play, this.millisecond ? 50 : 1000)
    } else {
      this.onFinish()
    }
  }

  /**
   * 开始倒计时
   */
  start = () => {
    // 计算截止时间
    this.deadline = Date.now() + this.time
    // 先清除原有计时任务
    clearTimeout(this.timer)
    // 倒计时
    this.play()
  }

  /**
   * 暂停倒计时
   */
  pause = () => {
    clearTimeout(this.timer)
  }

  /**
   * 重置倒计时
   */
  reset = () => {
    clearTimeout(this.timer)
    // 还原时间
    this.time = this.originalTime
    if (this.autoStart) {
      this.start()
    }
  }

  aboutToAppear(): void {
    if (this.controller) {
      this.controller.start = this.start
      this.controller.pause = this.pause
      this.controller.reset = this.reset
    }

    if (this.autoStart) {
      this.start()
    }
  }
  aboutToDisappear(): void {
    clearTimeout(this.timer)
  }

  @Builder
  renderCountDown() {
    Text(this.countDownTime)
      .fontSize(this.theme.fontSizeMd)
  }

  build() {
    this.customContent()
  }
}

export {
  WuCountDownController,
  WuCountDownTime,
}
