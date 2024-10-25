import WuUI, { WuSplash } from '@itrain/wu-ui'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Splash {
  aboutToAppear(): void {
    WuUI.setThemeStyles({
      // primary: '#d81e06',
    })
  }

  build() {
    Column() {
      WuSplash({
        duration: 5000,
        images: [$r('app.media.splash'), $r('app.media.splash2'), $r('app.media.splash3')],
        onFinished() {
          router.replaceUrl({
            url: 'pages/Main'
          })
        }
      })
    }
  }
}