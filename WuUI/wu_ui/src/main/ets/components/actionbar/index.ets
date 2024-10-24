import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { format99, noop } from '../../utils/Common'
import { WuIcon } from '../icon'

@Component
export struct WuActionBar {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  @Prop cartBadge: number = 0

  onMessageClick: () => void = noop
  onCartClick: () => void = noop
  onAddToCart: () => void = noop
  onBuyNow: () => void = noop

  @BuilderParam customIcons: () => void = this._renderIcons
  @BuilderParam customButtons: () => void = this._renderButtons

  @Builder
  _renderIcons() {
    Row({space: this.theme.spaceSm as string}) {
      WuIcon({name: 'message', iconSize: this.theme.heightMd})
      Stack() {
        WuIcon({name: 'cart', iconSize: this.theme.heightMd})

        Text(this.cartBadge !== 0 ? format99(this.cartBadge) : '')
          .fontSize(this.theme.fontSizeXs)
          .fontColor(this.theme.ghostWhite)
          .backgroundColor(this.theme.primary)
          .padding({left: this.theme.spaceXs, right: this.theme.spaceXs,})
          .borderRadius('50%')
          .offset({ x: 4, y: -4 })
      }
      .alignContent(Alignment.TopEnd)
    }
  }

  @Builder
  _renderButtons() {
    Row() {
      Button('加入购物车').onClick(this.onAddToCart)
        .fontSize(this.theme.fontSizeMd)
        .layoutWeight(1)
        .height(this.theme.heightLg)
        .opacity(0.8)
        .backgroundColor(this.theme.primary)
        .type(ButtonType.Normal)
        .borderRadius({
          topLeft: '50%',
          bottomLeft: '50%',
        })
      Button('立即购买').onClick(this.onBuyNow)
        .fontSize(this.theme.fontSizeMd)
        .layoutWeight(1)
        .height(this.theme.heightLg)
        .backgroundColor(this.theme.primary)
        .type(ButtonType.Normal)
        .borderRadius({
          topRight: '50%',
          bottomRight: '50%',
        })
    }
    .layoutWeight(1)
  }

  build() {
    Row({space: this.theme.spaceMd as string}) {
      // 图标
      this.customIcons()

      // 按钮
      this.customButtons()
    }
    .width('100%')
    .backgroundColor(this.theme.ghostWhite)
    .padding(this.theme.spaceXs)
  }
}