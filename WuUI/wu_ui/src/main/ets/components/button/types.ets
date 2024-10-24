import { WuThemeStyleValue } from '../../theme-chalk/types'

export class ButtonSize {
  padding: WuThemeStyleValue
  height: WuThemeStyleValue
  fontSize: WuThemeStyleValue

  constructor(padding: WuThemeStyleValue = 4, height: WuThemeStyleValue = 24, fontSize: WuThemeStyleValue = 12) {
    this.padding = padding
    this.height = height
    this.fontSize = fontSize
  }
}