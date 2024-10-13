import { setThemeStyles } from './src/main/ets/theme-chalk'
import WuStorage from './src/main/ets/utils/Storage'

// 初始化主题样式数据
setThemeStyles({})

export { WuSplash } from './src/main/ets/components/splash'
export { WuSearch } from './src/main/ets/components/search'
export { WuIcon } from './src/main/ets/components/icon'
export { WuButton } from './src/main/ets/components/button'
export { WuGrid, WuGridDataSource } from './src/main/ets/components/grid'
export { WuDivider } from './src/main/ets/components/divider'
export { WuCountDown, WuCountDownController, WuCountDownTime } from './src/main/ets/components/countdown'
export { WuBackTop } from './src/main/ets/components/backtop'
export { WuStepper } from './src/main/ets/components/stepper'
export { WuForm, WuFormRule } from './src/main/ets/components/form'
export { WuField } from './src/main/ets/components/field'

export default class WuUI {
  static init = WuStorage.init
  static setThemeStyles = setThemeStyles
}
