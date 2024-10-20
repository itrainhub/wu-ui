import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuShape, WuThemeStyles } from '../../theme-chalk/types'
import { noop } from '../../utils/Common'
import { WuButton } from '../button'
import { WuIcon } from '../icon'

@Component
export struct WuSearch {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyles = defaultStyles
  @Prop label: ResourceStr = ''
  @Prop name: string = ''
  @Prop placeholder: ResourceStr = '请输入搜索关键字'
  @Prop bgColor: ResourceColor = Color.White
  @Prop shape: WuShape = 'square'
  @Prop value: string = ''
  @Prop clearable: boolean = false
  @Prop showAction: boolean = false
  @Prop actionText: ResourceStr = '取消'
  @Prop disabled: boolean = false
  @Prop isReadonly: boolean = false

  onChange: EditableTextOnChangeCallback = noop
  onSearch: (enterKey: EnterKeyType, event: SubmitEvent) => void = noop
  onClear: (event: ClickEvent, previousValue: string) => void = noop
  onCancel: () => void = noop

  @BuilderParam customLeft: () => void = this.renderLeft
  @BuilderParam customLabel: () => void = this.renderLabel
  @BuilderParam customLeftIcon: () => void = this.renderIcon
  @BuilderParam customAction: () => void = this.renderAction

  @Builder
  renderLeft() {}

  @Builder
  renderLabel() {
    Text(this.label)
      .fontSize(this.theme.fontSizeMd)
  }
  @Builder
  renderIcon() {
    WuIcon({name: 'search'})
  }
  @Builder
  renderAction() {
    WuButton({
      text: this.actionText,
    })
      .onClick(this.onCancel)
  }

  build() {
    Row({space: 8}) {
      // 搜索框外，左侧
      this.customLeft()

      // 搜索框
      Row({space: this.theme.spaceXs as string}) {
        // 搜索框左侧文本
        this.customLabel()

        // 搜索框前图标
        this.customLeftIcon()

        // 搜索框区域
        Stack() {
          // 搜索框
          TextInput({
            placeholder: this.placeholder,
            text: this.value
          })
            .fontSize(this.theme.fontSizeMd)
            .enabled(!this.disabled)
            .focusable(!this.isReadonly)
            .width('100%')
            .placeholderFont({
              size: this.theme.fontSizeMd,
            })
            .placeholderColor(this.theme.lightGray)
            .borderRadius(0)
            .padding({left: this.theme.spaceXs})
            .backgroundColor(Color.Transparent)
            .onChange((val: string, previewText?: PreviewText) => {
              this.value = val
              this.onChange(val, previewText)
            })
            .onSubmit(this.onSearch)

          // 是否可删除图标
          Row({space: this.theme.spaceXs as string}) {
            if (this.clearable) {
              WuIcon({name: 'round_close_fill', color: this.theme.lightGray, iconSize: this.theme.fontSizeSm})
                .onClick((event: ClickEvent) => {
                  this.onClear(event, this.value)
                  this.value = ''
                })
            }
          }
          .width('100%')
          .justifyContent(FlexAlign.End)
        }
        .layoutWeight(1)
      }
      .layoutWeight(1)
      .height(30)
      .padding({left: this.theme.spaceMd, right: this.theme.spaceMd})
      .borderRadius(this.shape === 'square' ? 4 : 24)
      .backgroundColor(this.theme.ghostWhite)

      // 搜索框外，右侧取消按钮
      if (this.showAction) {
        this.customAction()
      }
    }
    .width('100%')
    .height(50)
    .padding({left: 12, right: 12})
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.bgColor)
  }
}