import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { WuIcon } from '../icon'

@Component
export struct WuBackTop {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop visible: boolean = false
  @Prop right: Dimension = 20
  @Prop bottom: Dimension = 20
  @Prop zIndexNum: number = 999
  scroller?: Scroller

  build() {
    if (this.visible) {
      Column() {
        WuIcon({name: 'top', iconSize: this.theme.fontSizeXl, color: this.theme.ghostWhite})
      }
      .width(32)
      .height(32)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(this.theme.primary)
      .borderRadius(16)
      .position({ right: this.right, bottom: this.bottom })
      .zIndex(this.zIndexNum)
      .onClick(() => {
        this.scroller?.scrollEdge(Edge.Top)
      })
    }
  }
}
