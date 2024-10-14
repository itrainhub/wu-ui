export interface WuCheckboxGroupContext {
  toggleAll: (checked?: boolean) => void
}

export const WU_CHECKBOX_GROUP_NAMESPACE = '__WU_UI_CHECKBOX_GROUP'

export enum WuCheckboxEventType {
  TOGGLE_ALL = 'toggleAll'
}
