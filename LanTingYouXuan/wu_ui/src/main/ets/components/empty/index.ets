import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'

@Component
export struct WuEmpty {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop image: ResourceStr = $r('app.media.__wu_empty')
  @Prop imageSize: Length = '128lpx'
  @Prop description: ResourceStr

  @BuilderParam customImage: () => void = this._renderImage
  @BuilderParam customDescription: () => void = this._renderText
  @BuilderParam customFooter: () => void

  @Builder
  _renderImage() {
    Image(this.image)
      .width(this.imageSize)
      .aspectRatio(1)
  }

  @Builder
  _renderText() {
    Text(this.description)
      .fontSize(this.theme.fontSizeMd)
      .fontColor(this.theme.gray)
  }

  build() {
    Column({space: this.theme.spaceMd as string}) {
      this.customImage()

      Text(this.description)

      this.customFooter?.()
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
