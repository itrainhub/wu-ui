import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord } from "../../theme-chalk/types"

@Component
export struct WuCellGroup {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  // 分组标题
  @Prop title: ResourceStr
  // 是否展示为圆角卡片风格
  @Prop inset: boolean = false
  // 是否显示外边框
  @Prop bordered: boolean = true
  // 背景颜色
  @Prop bgColor: ResourceColor = Color.Transparent

  @BuilderParam customTitle: () => void = this._renderTitle
  @BuilderParam customContent: () => void = this._renderDefault

  @Builder
  _renderTitle() {
    Text(this.title)
      .fontSize(this.theme.fontSizeMd)
  }
  @Builder
  _renderDefault() {}

  build() {
    Flex({
      direction: FlexDirection.Column,
    }) {
      // 分组标题
      Column() {
        this.customTitle()
      }
      .width('100%')
      .padding({left: this.inset ? 0 : this.theme.spaceMd, bottom: this.theme.spaceSm})
      .alignItems(HorizontalAlign.Start)

      Column() {
        this.customContent()
      }
      .width('100%')
      .borderWidth(this.bordered ? '2lpx' : 0)
      .borderColor(this.theme.lightGray)
      .borderRadius(this.inset ? this.theme.borderRadiusMd : 0)
      .clip(true)
    }
    .width('100%')
    .height('auto')
    .padding({
      top: this.theme.spaceSm,
      bottom: this.theme.spaceSm,
      left: this.inset ? this.theme.spaceMd : 0,
      right: this.inset ? this.theme.spaceMd : 0,
    })
    .backgroundColor(this.bgColor)
  }
}