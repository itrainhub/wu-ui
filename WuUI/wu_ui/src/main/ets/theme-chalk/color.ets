import { WuThemeColor } from './types'

class WuThemeColorImpl implements WuThemeColor {
  primary = '#1989fa'
  success = '#07c160'
  danger = '#ee0a24'
  warning = '#ff976a'
  default = '#ffffff'

  lightGray = '#dbdbdb'
  gray = '#8a8a8a'
  deepGray = '#515151'

  // ghostWhite = '#f8f8f8'
  ghostWhite = '#fafafa'
}

export const defaultThemeColor = new WuThemeColorImpl()
