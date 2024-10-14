import { WuCheckboxEventType } from "./types"

const WU_CHECKBOX_GROUP_NAMESPACE = '__WU_UI_CHECKBOX_GROUP'

interface WuCheckboxGroupItem {
  value: string[]
  onChange: (value: string[]) => void
}

// 保存应用中所有的复选框组数据,类似一个 Store
const checkboxGroups: Record<string, WuCheckboxGroupItem | null> = {}

/**
 * 初始化保存指定分组复选框数据信息
 */
export const initCheckboxGroup = (group: string, items: string[] = [], onChange: (value: string[]) => void) => {
  if (isGroupExist(group)) {
    console.warn(`分组名称为 ${group} 的复选框组命名重复了!!!`)
    return
  }
  // 初始化指定分组复选框数据
  checkboxGroups[group] = { value: items, onChange }
}

/**
 * 判断指定分组名称的筛选框组数据是否存在
 */
export const isGroupExist = (group: string): boolean => {
  return !!checkboxGroups[group]
}

/**
 * 更新指定分组复选框数据
 */
export const updateCheckboxGroup = (group: string, name: string, checked: boolean) => {
  if (!isGroupExist(group)) {
    console.warn(`分组名称为 ${group} 的复选框组组件不存在!!!`)
    return
  }

  // 当前分组数据
  const currGroup: WuCheckboxGroupItem = checkboxGroups[group]!

  if (checked) {
    currGroup.value = Array.from(new Set(currGroup.value.concat(name)))
  } else {
    currGroup.value = currGroup.value.filter(item => item !== name)
  }
  // 数据更新了，触发 onChange 回调执行
  currGroup.onChange(currGroup.value)
}

/**
 * 移除指定分组名称的复选框组数据
 */
export const removeCheckboxGroup = (group: string) => {
  checkboxGroups[group] = null
}

/**
 * 判断分组中指定项数据是否选中
 */
export const isChecked = (group: string, name: string) : boolean | undefined => {
  if (!isGroupExist(group)) {
    console.warn(`分组名称为 ${group} 的复选框组组件不存在!!!`)
    return
  }

  const value = checkboxGroups[group]!.value
  return value.includes(name)
}

// /**
//  * 获取指定复选框组的选中值
//  */
// export const getCheckboxGroupValue = (group: string) => {
//   return checkboxGroups[group]
// }

/**
 * 根据分组与事件类型生成事件名称字符串
 */
export const genCheckboxEventName = (group: string, eventType: WuCheckboxEventType) => {
  return `${WU_CHECKBOX_GROUP_NAMESPACE}_${group}_${eventType}}`
}