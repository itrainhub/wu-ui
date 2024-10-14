import { nextTick, noop } from "../../utils/Common"
import { WuCheckboxGroupContext, WuCheckboxEventType } from "./types"
import { genCheckboxEventName, initCheckboxGroup, removeCheckboxGroup } from "./util"
import { emitter } from "@kit.BasicServicesKit"

@Component
export struct WuCheckboxGroup {
  @Prop group: string
  @Link value: string[]
  // 加载结束回调，在 build() 之前调用到
  onLoad: (context: WuCheckboxGroupContext) => void = noop
  // 分组选择发生改变时触发 onChange 回调
  onChange: (value: string[]) => void = noop

  aboutToAppear(): void {
    // 初始化当前复选框组数据
    initCheckboxGroup(this.group, this.value, (value: string[]) => {
      this.value = value
      this.onChange(value)
    })

    // 执行加载完毕的回调
    this.onLoad(this)
  }

  aboutToDisappear(): void {
    // 移除当前复选框组数据
    removeCheckboxGroup(this.group)
  }

  toggleAll(checked?: boolean) {
    emitter.emit(genCheckboxEventName(this.group, WuCheckboxEventType.TOGGLE_ALL), {
      data: { checked }
    })
  }

  build() {

  }
}

export {
  WuCheckboxGroupContext
}
