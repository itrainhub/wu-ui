/* 颜色相关 */
// export enum WuColorType {
//   DEFAULT,
//   PRIMARY,
//   SUCCESS,
//   DANGER,
//   WARNING,
// }
//
// export enum DefaultColor {
//   PRIMARY = '#1989fa',
//   SUCCESS = '#07c160',
//   DANGER = '#ee0a24',
//   WARNING = '#ff976a',
//   DEFAULT = '#ffffff',
// }
// 颜色主题
export type  WuThemeType = 'primary' | 'success' | 'danger' | 'warning' | 'default'

export interface WuThemeColor {
  primary: ResourceColor
  success: ResourceColor
  danger: ResourceColor
  warning: ResourceColor
  default: ResourceColor

  lightGray: ResourceColor
  gray: ResourceColor
  deepGray: ResourceColor

  ghostWhite: ResourceColor

  // dark: ResourceColor
}

/* 字号相关 */
// export enum WuDefaultFontSize {
//   XS = '10fp',
//   SM = '12fp',
//   MD = '14fp',
//   LG = '16fp',
//   XL = '20fp',
// }

export interface WuThemeFontSize {
  fontSizeXs: Length
  fontSizeSm: Length
  fontSizeMd: Length
  fontSizeLg: Length
  fontSizeXl: Length
  fontSizeTitleXs: Length
  fontSizeTitleSm: Length
  fontSizeTitleMd: Length
  fontSizeTitleLg: Length
}

/* 间距空间相关 */
export interface WuThemeSpace {
  spaceXs: Length
  spaceSm: Length
  spaceMd: Length
  spaceLg: Length
  spaceXl: Length
}

/* 长度相关 */
export interface WuLength {
  heightXs: Length
  heightSm: Length
  heightMd: Length
  heightLg: Length
  heightXl: Length
  borderRadiusXs: Length
  borderRadiusSm: Length
  borderRadiusMd: Length
  borderRadiusLg: Length
}

export interface WuThemeStyles extends WuThemeColor, WuThemeFontSize, WuThemeSpace, WuLength {

}

// 形状
export type WuShape = 'square' | 'round'

// 位置
export type WuPosition = 'left' | 'right' | 'center'

export type WuThemeStyleValue = number | ResourceStr | ResourceColor

export type WuThemeStyleRecord = Record<keyof WuThemeStyles, WuThemeStyleValue>