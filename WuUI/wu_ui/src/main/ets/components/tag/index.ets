import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuShape, WuThemeStyleRecord, WuThemeStyleValue, WuThemeType } from "../../theme-chalk/types"
import { hexToRgb, noop } from "../../utils/Common"
import { WuIcon } from "../icon"

class WuTagSize {
  padding: WuThemeStyleValue
  height: WuThemeStyleValue
  fontSize: WuThemeStyleValue

  constructor(padding: WuThemeStyleValue = 4, height: WuThemeStyleValue = 24, fontSize: WuThemeStyleValue = 12) {
    this.padding = padding
    this.height = height
    this.fontSize = fontSize
  }
}

@Extend(Row)
function tagSize(size: WuTagSize) {
  .height(size.height)
  .padding({ left: size.padding, right: size.padding })
}

@Component
export struct WuTag {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  @Prop type: WuThemeType = 'default'
  @Prop text: ResourceStr
  @Prop tagSize: 'small' | 'normal' | 'large' = 'normal'
  @Prop color: string
  @Prop show: boolean = true
  @Prop plain: boolean
  @Prop shape: WuShape
  @Prop mark: boolean
  @Prop textColor: string
  @Prop closeable: boolean
  @Prop hairline: boolean // 细边框
  @Prop bordered: boolean = true // 是否显示边框

  @BuilderParam customText: () => void = this._renderText

  onClose: () => void = noop

  /**
   * 计算获取背景颜色
   */
  private getBackColor() {
    if (this.plain) {
      return Color.Transparent
    }

    if (this.color) {
      return this.color
    }

    if (this.textColor) {
      return `rgba(${hexToRgb(this.textColor)},0.3)`
    }

    return this.theme[this.type]
  }

  /**
   * 计算获取边框颜色
   */
  private getBorderColor() {
    return this.color
      ?? this.textColor
      ?? (this.type === 'default' ? this.theme.lightGray : this.theme[this.type])
  }

  /**
   * 计算获取文字颜色
   */
  private getFontColor() {
    if (this.plain) {
      return this.textColor
        ?? this.color
        ?? (this.type === 'default' ? this.theme.deepGray : this.theme[this.type])
    }
    return this.textColor
      ?? (this.type === 'default' ? this.theme.deepGray : this.theme.ghostWhite)
  }

  /**
   * 获取边框圆角
   * @returns
   */
  private getBorderRadius(): Length | BorderRadiuses {
    if (this.mark) {
      return {
        topLeft: 0,
        topRight: '50%',
        bottomLeft: 0,
        bottomRight: '50%',
      }
    }
    return typeof this.shape === 'undefined' ? this.theme.borderRadiusXs : this.shape === 'square' ? 0 : '50%'
  }

  /**
   * 计算获取按钮大小
   * @returns
   */
  private getTagSize() {
    let size: WuTagSize = new WuTagSize()
    switch (this.tagSize) {
      case 'small':
        size = new WuTagSize(this.theme.spaceXs, this.theme.heightSm, this.theme.fontSizeSm)
        break
      case 'normal':
        size = new WuTagSize(this.theme.spaceSm, this.theme.heightMd, this.theme.fontSizeMd)
        break
      case 'large':
        size = new WuTagSize(this.theme.spaceMd, this.theme.heightLg, this.theme.fontSizeLg)
        break
    }

    return size
  }

  @Builder
  _renderText() {
    Text(this.text)
      .fontSize(this.tagSize === 'large' ? this.theme.fontSizeLg : this.tagSize === 'normal' ? this.theme.fontSizeMd : this.theme.fontSizeSm)
      .fontColor(this.getFontColor())
  }

  build() {
    if (this.show) {
      Row() {
        // 文本
        this.customText()
        // 关闭按钮
        if (this.closeable) {
          WuIcon({
            name: 'close',
            color: this.getFontColor(),
            iconSize: this.theme.fontSizeSm,
          })
            .margin({left: this.theme.spaceXs})
            .onClick(() => {
              this.onClose()
            })
        }
      }
      .tagSize(this.getTagSize())
      .backgroundColor(this.getBackColor())
      .borderWidth(this.bordered ? (this.hairline ? '1lpx' : '2lpx') : 0)
      .borderColor(this.getBorderColor())
      .borderRadius(this.getBorderRadius())
    }
  }
}