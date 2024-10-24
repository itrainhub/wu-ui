import ObjectUtil from '../utils/ObjectUtil'
import { defaultThemeColor } from './color'
import { defaultThemeFontSize} from './font'
import { defaultLength } from './length'
import { defaultThemeSpace } from './space'
import { WuThemeStyleRecord, WuThemeStyles } from './types'

/**
 * 获取默认样式
 */
export const getDefaultThemeStyles = (): WuThemeStyleRecord => {
  const defaultStyles = ObjectUtil.assign<WuThemeStyles>({}, defaultThemeColor, defaultThemeFontSize, defaultThemeSpace, defaultLength)

  return defaultStyles
}

// 默认样式
export const defaultStyles = getDefaultThemeStyles()

// 主题全局名称标识
export const WU_THEME_NAMESPACE = '__WU_UI_THEME_STYLE__'

/**
 * 设置主题样式
 */
export const setThemeStyles = (theme: Partial<WuThemeStyles>) => {
  let styles = getDefaultThemeStyles() as Partial<WuThemeStyles>
  styles = ObjectUtil.assign(styles, theme)
  AppStorage.setOrCreate(WU_THEME_NAMESPACE, styles)
}

// /**
//  * 获取主题样式
//  */
// export const getThemeStyles = (): Record<keyof WuThemeStyles, ResourceStr> => {
//   const styles = AppStorage.get<Record<keyof WuThemeStyles, ResourceStr>>(THEME_NAMESPACE)
//   return styles ?? defaultStyles
// }
