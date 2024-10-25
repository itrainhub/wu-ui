import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { WuCircular } from './circular'
import { WuSpinner } from './spinner'

@Component
export struct WuLoading {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop iconSize: Length = '48lpx'
  @Prop type: 'circular' | 'spinner' = 'circular'
  @Prop color: string = this.theme.lightGray as string
  @Prop text: ResourceStr = ''
  @Prop vertical: boolean = false

  @BuilderParam customIcon: () => void = this._renderShape
  @BuilderParam customText: () => void = this._renderText

  @Builder
  _renderShape() {
    if (this.type === 'circular') {
      WuCircular({
        iconSize: this.iconSize,
        color: this.color
      })
    } else {
      WuSpinner({
        iconSize: this.iconSize,
        color: this.color,
      })
    }
  }

  @Builder
  _renderText() {
    Text(this.text)
      .fontSize(this.theme.fontSizeMd)
      .fontColor(this.color)
  }

  @Builder
  _renderLoading() {
    this.customIcon()
    this.customText()
  }

  build() {
    if (this.vertical) {
      Column({space: this.theme.spaceSm as string}) {
        this._renderLoading()
      }
    } else {
      Row({space: this.theme.spaceSm as string}) {
        this._renderLoading()
      }
    }
  }
}
