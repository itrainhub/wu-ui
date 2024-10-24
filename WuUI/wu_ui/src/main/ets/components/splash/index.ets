import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord } from "../../theme-chalk/types"
import { noop } from "../../utils/Common"

@Component
export struct WuSplash {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  // 延迟时间, 单位毫秒
  @Prop duration: number = 5000
  // 过渡页面图片
  @Prop image: ResourceStr = $r("app.media.__wu_splash")
  // 多图过渡
  @Prop images: ResourceStr[] = []
  // 自定义最后一张图片显示的按钮，设置 images 后有效
  @BuilderParam customLastCarousel: () => void = this.renderLastCarousel
  // 计时结束事件
  onFinished: () => void = noop
  // 计时器id
  timer: number = 0
  // 剩余时间
  @State last: number = 0

  aboutToAppear(): void {
    const endtime = Date.now() + this.duration

    // 倒计时
    const calcTime = () => {
      this.last = Math.ceil((endtime - Date.now()) / 1000)
      if (this.last > 0) {
        this.timer = setTimeout(calcTime, 1000)
      } else {
        this.onFinished()
      }
    }

    if (this.duration > 0) {
      calcTime()
    }
  }

  aboutToDisappear(): void {
    clearTimeout(this.timer)
  }

  @Builder
  renderLastCarousel() {
    Row() {
      Button('开始体验')
        .onClick(this.onFinished)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .position({bottom: 80})
  }

  @Styles
  fullSize() {
    .width('100%')
    .height('100%')
  }

  build() {
    Stack() {
      Column() {
        if (this.images.length > 0) {
          Swiper() {
            ForEach(this.images, (image: ResourceStr, index: number) => {
              Stack() {
                Image(image)
                  .objectFit(ImageFit.Fill)
                  .fullSize()
                if (index === this.images.length - 1) {
                  this.customLastCarousel()
                }
              }
              .fullSize()
            })
          }
          .fullSize()
          .indicator(
            new DotIndicator()
              .color('#ffffff')
          )
          .loop(false)
        } else {
          Image(this.image)
            .objectFit(ImageFit.Fill)
            .fullSize()
        }
      }
      .fullSize()

      if (this.duration > 0) {
        Row({space: 4}) {
          Text('跳过')
            .fontSize(this.theme.fontSizeSm)
            .fontColor('#7a7a7a')
          Divider()
            .vertical(true)
            .width(1)
          Text(`${this.last}S`)
            .fontSize(this.theme.fontSizeSm)
            .fontColor('#7a7a7a')
        }
        .height(30)
        .padding({ top: 6, bottom: 6, left: 12, right: 12 })
        .backgroundColor('#eaeaea')
        .borderRadius(24)
        .position({
          top: 18,
          right: 18,
        })
        .onClick(() => {
          clearTimeout(this.timer)
          this.onFinished()
        })
      }
    }
    .fullSize()
  }
}