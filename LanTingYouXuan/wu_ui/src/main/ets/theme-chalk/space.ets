import { WuThemeSpace } from './types'

class WuThemeSpaceImpl implements WuThemeSpace {
  spaceXs: Length = '8lpx'
  spaceSm: Length = '16lpx'
  spaceMd: Length = '24lpx'
  spaceLg: Length = '32lpx'
  spaceXl: Length = '48lpx'
}

export const defaultThemeSpace = new WuThemeSpaceImpl()
