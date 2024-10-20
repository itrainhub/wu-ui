import { emitter } from '@kit.BasicServicesKit'
import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuShape, WuThemeStyleRecord } from '../../theme-chalk/types'
import { noop } from '../../utils/Common'
import { WuCheckboxEventType } from './types'
import { genCheckboxEventName, isChecked, updateCheckboxGroup } from './util'

@Component
export struct WuCheckbox {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop checked: boolean = false
  @Prop name: string
  @Prop label: ResourceStr
  @Prop shape: WuShape = 'round'
  @Prop disabled: boolean = false
  @Prop checkedColor: ResourceColor = this.theme.primary
  @Prop group: string // 分组

  onChange: (checked: boolean) => void = noop

  aboutToAppear(): void {
    if (this.hasGroup()) {
      // 注册事件监听，用于全选处理时当前复选框接收数据
      emitter.on(genCheckboxEventName(this.group, WuCheckboxEventType.TOGGLE_ALL), this.toggle)
      // 如果复选框组有初始数据，当前复选框是否选中
      const checked = isChecked(this.group, this.name)
      if (typeof checked === 'boolean') {
        this.checked = checked
      }
    }
  }

  aboutToDisappear(): void {
    emitter.off(genCheckboxEventName(this.group, WuCheckboxEventType.TOGGLE_ALL), this.toggle)
  }

  /**
   * 切换选中状态
   */
  toggle = (event: emitter.EventData) => {
    const checked: boolean | undefined = event.data?.checked
    this.checked = typeof checked === 'boolean' ? checked : !this.checked
  }

  /**
   * 判断是否有分组
   */
  hasGroup() {
    return !!this.group
  }

  build() {
    Row({space: this.theme.spaceXs as string}) {
      Checkbox()
        .select($$this.checked)
        .height(this.theme.heightXs)
        .aspectRatio(1)
        .shape(this.shape === 'round' ? CheckBoxShape.CIRCLE : CheckBoxShape.ROUNDED_SQUARE)
        .selectedColor(this.checkedColor)
        .enabled(!this.disabled)
        .onChange((checked: boolean) => {
          // 有分组，则更新分组中的数据
          if(this.hasGroup()) {
            updateCheckboxGroup(this.group, this.name, checked)
          }
          // 执行 onChange 回调
          this.onChange(checked)
        })
      Text(this.label)
        .fontSize(this.theme.fontSizeMd)
        .onClick(() => {
          this.checked = !this.checked
        })
    }
    .enabled(!this.disabled)
  }
}