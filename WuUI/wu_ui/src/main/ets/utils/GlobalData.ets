import { window } from "@kit.ArkUI"
import { BusinessError } from "@kit.BasicServicesKit"

export default class WuGlobalData {
  // 顶部安全区
  public static safeAreaInsetTop: number
  // 底部安全区
  public static safeAreaInsetBottom: number
  // 屏幕宽度
  public static screenWidth: number
  // 屏幕高度
  public static screenHeight: number
  // UI 上下文
  public static context: UIContext

  /**
   * 初始化组件库
   * @param windowStage
   */
  public static init(windowStage: window.WindowStage) {
    windowStage.getMainWindow((err: BusinessError, data) => {
      if (err.code) {
        console.error(`Failed to obtain the main window. Cause code: ${err.code}, message: ${err.message}`)
        return
      }

      // 上下文
      WuGlobalData.context = data.getUIContext()
      // 注册字体图标
      data.getUIContext().getFont().registerFont({
        familyName: 'wuicon',
        familySrc: $rawfile('wuui-icon.ttf'),
      })
      // 获取顶部与底部安全区
      const topArea = window.AvoidAreaType.TYPE_SYSTEM
      const bottomArea = window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR
      WuGlobalData.safeAreaInsetTop = px2vp(data.getWindowAvoidArea(topArea).topRect.height)
      WuGlobalData.safeAreaInsetBottom = px2vp(data.getWindowAvoidArea(bottomArea).bottomRect.height)
      // 屏幕宽高
      const winRect = data.getWindowProperties().windowRect
      WuGlobalData.screenWidth = px2vp(winRect.width)
      WuGlobalData.screenHeight = px2vp(winRect.height)
      console.log('winRect:', JSON.stringify(winRect))
    })
  }
}