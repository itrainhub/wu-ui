import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuShape, WuThemeStyleRecord } from "../../theme-chalk/types"
import { WuButton } from "../button"

@Component
export struct WuStepper {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop value: number
  @Prop shape: WuShape = 'square'
  @Prop disableInput: boolean = true

  onChange: (value: number) => void = () => {}

  @Styles
  btn() {
    .backgroundColor(this.theme.primary)
    .width(this.theme.heightMd)
    .aspectRatio(1)
    .padding(0)
  }

  build() {
    Row({space: '2lpx'}) {
      WuButton({
        text: '-',
        shape: this.shape,
        btnSize: 'small',
        type: this.shape === 'round' ? 'primary' : 'default',
      })
        .enabled(this.value > 1)
        .onClick(() => {
          this.value -= 1
          this.onChange(this.value)
        })

      TextInput({
        text: this.value + ''
      })
        .type(InputType.Number)
        .enabled(!this.disableInput)
        .btn()
        .aspectRatio(1.3)
        .textAlign(TextAlign.Center)
        .fontSize(this.theme.fontSizeSm)
        .backgroundColor(this.shape === 'square' ? this.theme.lightGray : Color.Transparent)
        .borderRadius(0)
        .onChange((val: string) => {
          this.value = Number(val)
        })

      WuButton({
        text: '+',
        shape: this.shape,
        btnSize: 'small',
        type: this.shape === 'round' ? 'primary' : 'default',
      })
        .onClick(() => {
          this.value += 1
          this.onChange(this.value)
        })
    }
  }
}