import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuPosition, WuThemeStyleRecord } from "../../theme-chalk/types"

@Component
export struct WuDivider {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  @Prop dashed: boolean = false // 是否使用虚线
  @Prop text: string = '' // 分割线上的文本
  @Prop textPosition: WuPosition = 'center' // 文本位置
  @Prop hairline: boolean = false // 是否使用 0.5px 线

  @BuilderParam customText: () => void = this.renderText

  @Builder
  renderText() {
    Text(this.text)
      .fontSize(this.theme.fontSizeMd)
  }

  private getPosition(): Edges {
    if (this.textPosition === 'left') {
      return {
        left: '96lpx',
      }
    }
    if (this.textPosition === 'right') {
      return {
        right: '96lpx'
      }
    }
    return {}
  }

  build() {
    Stack() {
      Divider()
        .borderWidth(this.hairline ? '1lpx' : '2lpx')
        .borderColor(this.theme.lightGray)
        .borderStyle(this.dashed ? BorderStyle.Dashed : BorderStyle.Solid)
      Column() {
        this.customText()
      }
      .backgroundColor(Color.White)
      .position(this.getPosition())
      .padding({left: this.theme.spaceMd, right: this.theme.spaceMd})
    }
  }
}