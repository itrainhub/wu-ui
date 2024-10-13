import { window } from "@kit.ArkUI"
import { BusinessError } from "@kit.BasicServicesKit"

export default class WuStorage {
  /**
   * 初始化组件库
   * @param windowStage
   */
  public static init(windowStage: window.WindowStage) {
    console.log('wuui init.......')
    // 注册iconfont字体图标
    windowStage.getMainWindow((err: BusinessError, data) => {
      if (err.code) {
        console.error(`Failed to obtain the main window. Cause code: ${err.code}, message: ${err.message}`)
        return
      }
      console.log('success............haha')
      data.getUIContext().getFont().registerFont({
        familyName: 'wuicon',
        familySrc: $rawfile('wuui-icon.ttf'),
      })
    })
  }
}