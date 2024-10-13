import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord, WuShape, WuThemeType } from "../../theme-chalk/types"
import { ButtonSize } from "./types"

@Extend(Button)
function buttonSize(size: ButtonSize) {
  .width('auto')
  .height(size.height)
  .padding({ left: size.padding, right: size.padding })
  .fontSize(size.fontSize)
}

@Component
export struct WuButton {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop type: WuThemeType = 'default'
  @Prop text: ResourceStr = '按钮'
  @Prop shape: WuShape = 'square'
  @Prop btnSize: 'mini' | 'small' | 'normal' | 'large' = 'normal'
  @Prop plain: boolean = false
  @Prop disabled: boolean = false

  /**
   * 计算获取文字颜色
   */
  private getFontColor() {
    if (this.type === 'default') {
      return this.theme.deepGray
    }
    if (this.plain) {
      return this.theme[this.type]
    }

    return Color.White
  }

  /**
   * 计算获取按钮大小
   * @returns
   */
  private getBtnSize() {
    let size: ButtonSize = new ButtonSize()
    switch (this.btnSize) {
      case 'mini':
        size = new ButtonSize(this.theme.spaceXs, this.theme.heightXs, this.theme.fontSizeXs)
        break
      case 'small':
        size = new ButtonSize(this.theme.spaceSm, this.theme.heightSm, this.theme.fontSizeSm)
        break
      case 'normal':
        size = new ButtonSize(this.theme.spaceMd, this.theme.heightMd, this.theme.fontSizeMd)
        break
      case 'large':
        size = new ButtonSize(this.theme.spaceXl, this.theme.heightLg, this.theme.fontSizeLg)
    }
    console.log('size:::', JSON.stringify(size))

    return size
  }

  build() {
    Button() {
      Text(this.text)
        .fontColor(this.getFontColor())
        .fontWeight(FontWeight.Normal)
        .fontSize(this.getBtnSize().fontSize)
    }
      .backgroundColor(this.plain ? Color.Transparent : this.theme[this.type])
      .type(ButtonType.Normal)
      .borderRadius(this.shape === 'square' ? 4 : '50%')
      .borderWidth(1)
      .borderColor(this.type === 'default' ? this.theme.lightGray : this.theme[this.type])
      .buttonSize(this.getBtnSize())
      .enabled(!this.disabled)
  }
}