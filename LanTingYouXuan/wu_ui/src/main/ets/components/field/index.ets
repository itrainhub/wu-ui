import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord } from "../../theme-chalk/types"
import { WuFormRuleError } from "../form/types"
import { WuFormRule } from "../form/types"
import { WuIcon } from "../icon"

@Component
export struct WuField {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Link value: string
  @Prop name?: string
  @Prop label: string = ''
  @Prop labelWidth: Length = 'auto'
  @Prop labelAlign: TextAlign = TextAlign.Start
  @Prop placeholder: string = '请输入文本'
  @Prop type: InputType = InputType.Normal
  @Prop bgColor: ResourceColor = this.theme.ghostWhite
  @Prop textArea: boolean = false
  @Prop required: boolean = false
  @Prop clearable: boolean = false
  @Prop inputBordered: boolean = true
  @Prop errMessage: ResourceStr = ''
  @Prop rules: WuFormRule[] = []

  @State errMsg: ResourceStr = ''
  @State passwordIcon: string = 'attention_forbid'
  @State passwordVisible: boolean = false
  @State inputRightPadding: Length = 0

  private baseHeight: string = this.theme.heightMd as string

  @BuilderParam customButton: () => void = this._renderButton

  aboutToAppear() {
    // 校验规则中是否有必填
    for(let i = 0, len = this.rules.length; i < len; i++) {
      const rule: WuFormRule = this.rules[i]
      if (typeof rule.required === 'boolean' && rule.required) {
        this.required = true
        this.errMessage = rule.message
      }
    }
    // 输入框右侧清除与密码图标宽度
    if (this.clearable) {
      this.inputRightPadding = parseFloat(this.inputRightPadding as string) + parseFloat(this.theme.spaceSm as string) + 32 + 'lpx'
    }
    if (this.type === InputType.Password) {
      this.inputRightPadding = parseFloat(this.inputRightPadding as string) + parseFloat(this.theme.spaceSm as string) + 32 + 'lpx'
    }
  }

  @Builder
  _renderButton() {}

  /**
   * 字段校验
   * @param value
   * @param type
   * @returns
   */
  validateField(value: string, type: 'blur' | 'change') {
    return new Promise<boolean>((resolve, reject) => {
        for(let i = 0, len = this.rules.length; i < len; i++) {
          const rule: WuFormRule = this.rules[i]
          // 没有校验时机，则默认 blur
          rule.trigger = rule.trigger ?? 'blur'
          // 是否触发校验
          const trigger = Array.isArray(rule.trigger) ? rule.trigger.includes(type) : rule.trigger === type
          // 触发校验
          if (trigger) {
            if (
              typeof rule.required === 'boolean' && rule.required && value.length === 0 // required 规则
              || rule.pattern && !rule.pattern.test(value) // 正则规则
              || rule.validator && !rule.validator(value) // 自定义校验规则
            ) {
              reject({
                name: this.name,
                message: rule.message
              })
              return
            }
          }
        }
      resolve(true)
    })


  }

  /**
   * 渲染输入框
   */
  @Builder
  _renderTextInput() {
    if (this.textArea) {
      TextArea()
    } else {
      Stack() {
        // 文本框
        TextInput({
          text: $$this.value,
          placeholder: this.placeholder,
        })
          .type(this.type)
          .borderRadius(0)
          .backgroundColor(Color.Transparent)
          .width('100%')
          .height(this.baseHeight)
          .placeholderFont({
            size: this.theme.fontSizeMd,
          })
          .fontSize(this.theme.fontSizeMd)
          .padding({left: this.theme.spaceSm, right: this.inputRightPadding, top: 0, bottom: 0})
          .borderWidth(this.inputBordered ? '2lpx' : 0)
          .borderColor(this.errMsg ? this.theme.primary : this.theme.lightGray)
          .borderRadius('8lpx')
          .showPasswordIcon(false)
          .showPassword(this.passwordVisible)
          .showError(this.errMsg)
          .showUnderline(!this.inputBordered && this.errMsg !== '')
          .onChange(val => {
            if (this.required && val.length !== 0) {
              this.errMsg = ''
            }
            this.validateField(val, 'change')
              .then((val: boolean) => {
                if (val) {
                  this.errMsg = ''
                }
              })
              .catch((err: WuFormRuleError) => {
                this.errMsg = err.message
              })
          })
          .onBlur(() => {
            if (this.required && this.value.length === 0) {
              this.errMsg = this.errMessage ?? '当前字段必填'
            } else {
              this.errMsg = ''
            }
            this.validateField(this.value, 'blur')
              .then((val: boolean) => {
                if (val) {
                  this.errMsg = ''
                }
              })
              .catch((err: WuFormRuleError) => {
                this.errMsg = err.message
              })
          })

        // 清除与密码图标
        Row({space: this.theme.spaceXs as string}) {
          if (this.clearable && this.value) {
            WuIcon({name: 'round_close_fill', color: this.theme.lightGray})
              .onClick(() => {
                this.value = ''
              })
          }
          if (this.type === InputType.Password) {
            WuIcon({name: this.passwordIcon, color: this.theme.lightGray})
              .onClick(() => {
                console.log('icon click...')
                this.passwordVisible = !this.passwordVisible
                this.passwordIcon = this.passwordVisible ? 'attention' : 'attention_forbid'
              })
          }
        }
        .height(this.baseHeight)
        .padding({right: this.theme.spaceSm})
      }
      .layoutWeight(1)
      .alignContent(Alignment.TopEnd)
    }
  }

  build() {
    Row({space: this.theme.spaceXs as string}) {
      // 星号
      if (this.required) {
        Text('*')
          .fontColor(Color.Red)
          .height(this.baseHeight)
      }
      // 标签
      Text(this.label)
        .width(this.labelWidth)
        .height(this.baseHeight)
        .fontSize(this.theme.fontSizeMd)
        .textAlign(this.labelAlign)
      // 文本框
      this._renderTextInput()
      // 右侧按钮
      this.customButton()
    }
    .backgroundColor(this.bgColor)
    .padding(this.theme.spaceSm)
    .margin(this.theme.spaceSm)
    .borderRadius(this.theme.borderRadiusSm)
    .alignItems(VerticalAlign.Top)
  }
}