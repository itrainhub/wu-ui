import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { noop } from '../../utils/Common'
import { WuIcon } from '../icon'

@Component
export struct WuNavBar {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  // 标题文本
  @Prop title: ResourceStr = ''
  // 是否有返回按钮
  @Prop back: boolean = true
  // 左侧文本
  @Prop leftText: ResourceStr = ''
  // 是否显示左侧箭头
  @Prop leftArrow: boolean = false
  // 右侧文本
  @Prop rightText: ResourceStr = ''

  // 事件函数，点击左侧文本触发的回调
  onLeftClick: () => void = noop
  // 事件函数，点击右侧文本触发的回调
  onRightClick: () => void = noop

  // 提供自定义构建函数，以自定义在标题处的布局结构
  @BuilderParam customTitle: () => void = this._renderTitle

  // 自定义右侧按钮
  @BuilderParam customRight: () => void = this._renderRight

  // 自定义左侧按钮
  @BuilderParam customLeft: () => void = this._renderLeft

  /**
   * 默认标题栏显示文本
   */
  @Builder
  _renderTitle() {
    Text(this.title)
      .fontSize(this.theme.fontSizeTitleSm)
      .fontWeight(FontWeight.Bold)
      .textAlign(TextAlign.Center)
      .width('100%')
      .maxLines(1)
      .textOverflow({
        overflow: TextOverflow.Ellipsis,
      })
  }

  /**
   * 左侧按钮
   */
  @Builder
  _renderLeft() {
    Row() {
      if (this.leftArrow) {
        WuIcon({
          name: 'back',
          color: this.theme.primary,
        })
      }
      Text(this.leftText)
        .fontSize(this.theme.fontSizeXl)
        .fontColor(this.theme.primary)
    }
    .onClick(this.onLeftClick)
  }

  /**
   * 右侧按钮
   */
  @Builder
  _renderRight() {
    Text(this.rightText)
      .fontSize(this.theme.fontSizeXl)
      .fontColor(this.theme.primary)
      .onClick(this.onRightClick)
  }

  build() {
    Column() {
      Stack() {
        // 中间标题
        Column() {
          this.customTitle()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({left: '108lpx', right: '108lpx'})

        Row() {
          // 左侧按钮
          if (this.back) {
            this.customLeft()
          }
          Blank()
          // 右侧按钮
          this.customRight()
        }
        .width('100%')
      }
      .width('100%')
      .alignContent(Alignment.TopStart)
      .padding({left: '24lpx', right: '24lpx'})
    }
    .width('100%')
    .height('108lpx')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.theme.ghostWhite)
  }
}
