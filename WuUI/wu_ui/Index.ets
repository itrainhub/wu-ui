import { setThemeStyles } from './src/main/ets/theme-chalk'
import WuGlobalData from './src/main/ets/utils/GlobalData'

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
export { WuCheckbox } from './src/main/ets/components/checkbox'
export { WuCheckboxGroup, WuCheckboxGroupContext } from './src/main/ets/components/checkbox/checkbox-group'
export { WuCard, WuCardProps } from './src/main/ets/components/card'
export { WuLoading } from './src/main/ets/components/loading'
export { WuSubmitBar } from './src/main/ets/components/submitbar'
export { WuActionBar } from './src/main/ets/components/actionbar'
export { WuEmpty } from './src/main/ets/components/empty'
export { WuPopup } from './src/main/ets/components/popup'
export { WuImage } from './src/main/ets/components/image'
export { WuCell, WuCellGroup } from './src/main/ets/components/cell'
export { WuToast } from './src/main/ets/components/toast'
export { WuSwipeCell } from './src/main/ets/components/swipecell'
export { WuTag } from './src/main/ets/components/tag'

export default class WuUI {
  static init = WuGlobalData.init
  static setThemeStyles = setThemeStyles
}
