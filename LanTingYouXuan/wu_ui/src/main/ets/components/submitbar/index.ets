import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord } from "../../theme-chalk/types"
import { noop } from "../../utils/Common"
import { splitPrice } from "../../utils/PriceUtil"
import { WuButton } from "../button"
import { WuCheckbox } from "../checkbox"

@Component
export struct WuSubmitBar {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  @Prop checked: boolean = false
  @Prop currency: string = '￥'
  @Prop price: number = 0
  @Prop buttonText: string = '提交订单'
  @Prop checkAll: boolean = true
  @Prop tip: string = ''

  onCheckedChange: (checked: boolean) => void = noop
  onSubmit: () => void = noop

  @BuilderParam customCheckAll: () => void = this._renderCheckAll
  @BuilderParam customButton: () => void = this._renderButton
  @BuilderParam customTip: () => void = this._renderTip

  @Builder
  _renderCheckAll() {
    Row() {
      WuCheckbox({
        checked: this.checked,
        onChange: (checked: boolean) => {
          this.onCheckedChange(checked)
        }
      })
      Text('全选')
        .fontSize(this.theme.fontSizeMd)
        .onClick(() => {
          this.checked = !this.checked
        })
    }
  }

  @Builder
  _renderTotal() {
    Text() {
      Span('合计:')
        .fontSize(this.theme.fontSizeMd)
      Span(this.currency)
        .fontSize(this.theme.fontSizeSm)
      Span(splitPrice(this.price).integerPart)
        .fontSize(this.theme.fontSizeXl)
        .fontWeight(FontWeight.Bold)
      Span('.')
      Span(splitPrice(this.price).decimalPart)
        .fontSize(this.theme.fontSizeSm)
    }
    .fontColor(this.theme.primary)
  }

  @Builder
  _renderButton() {
    WuButton({
      text: this.buttonText,
      type: 'primary',
    })
      .onClick(() => {
        this.onSubmit()
      })
  }

  @Builder
  _renderTip() {
    Text(this.tip)
      .fontSize(this.theme.fontSizeSm)
      .fontColor(this.theme.warning)
  }

  build() {
    Column() {
      Row() {
        this.customTip()
      }
      .width('100%')
      .padding(this.theme.spaceSm)
      .backgroundColor('#fffbe8')

      Row({space: this.theme.spaceSm as string}) {
        if (this.checkAll) {
          this.customCheckAll()
        }

        Blank()
        this._renderTotal()

        this.customButton()
      }
      .width('100%')
      .padding(this.theme.spaceSm)
      .alignItems(VerticalAlign.Center)
      .borderWidth({top: 1})
      .borderColor(this.theme.lightGray)
      .backgroundColor(this.theme.ghostWhite)
    }
    .width('100%')
    .padding({top: this.theme.spaceXs})
  }
}