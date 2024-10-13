
export interface WuFormRule {
  required?: boolean
  message: ResourceStr
  pattern?: RegExp
  validator?: (value: string) => boolean
  trigger?: 'blur' | 'change' | ('blur' | 'change')[]
}

export interface WuFormRuleError {
  name: string
  message: string
}
