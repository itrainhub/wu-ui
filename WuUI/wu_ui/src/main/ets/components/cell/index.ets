import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord } from "../../theme-chalk/types"
import { WuIcon } from "../icon"

@Component
export struct WuCell {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  // 左侧标题
  @Prop title: ResourceStr
  // 右侧内容
  @Prop value: ResourceStr
  // 标题下方描述
  @Prop label: ResourceStr
  // 标题前图标
  @Prop icon: string
  // 是否展示右侧箭头
  @Prop isLink: boolean = false
  // 背景颜色
  @Prop bgColor: ResourceColor = Color.White
  // 是否开启点击反馈
  @Prop clickable: boolean = false
  // 是否显示内边框
  @Prop bordered: boolean = true
  // 是否使内容垂直居中
  @Prop center: boolean = false

  @BuilderParam customTitle: () => void = this._renderTitle
  @BuilderParam customLabel: () => void = this._renderLabel
  @BuilderParam customValue: () => void = this._renderValue
  @BuilderParam customIcon: () => void = this._renderIcon
  @BuilderParam customRightIcon: () => void = this._renderRightIcon

  @Builder
  _renderIcon() {
    if (this.icon) {
      WuIcon({ name: this.icon, color: this.theme.deepGray })
    }
  }
  @Builder
  _renderTitle() {
    Text(this.title)
      .fontSize(this.theme.fontSizeMd)
  }
  @Builder
  _renderLabel() {
    Text(this.label)
      .fontSize(this.theme.fontSizeSm)
      .fontColor(this.theme.gray)
  }
  @Builder
  _renderValue() {
    Text(this.value)
      .fontSize(this.theme.fontSizeMd)
  }
  @Builder
  _renderRightIcon() {
    if (this.isLink) {
      WuIcon({ name: 'right', color: this.theme.gray })
    }
  }

  build() {
    Row() {
      Flex({
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: this.center ? ItemAlign.Center : ItemAlign.Start,
      }) {
        // 左侧
        Column({ space: this.theme.spaceXs as string }) {
          // 图标与标题
          Row({ space: this.theme.spaceXs as string }) {
            this.customIcon()
            this.customTitle()
          }
          .alignItems(VerticalAlign.Center)

          // 描述
          Row() {
            this.customLabel()
          }
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
        .alignSelf(ItemAlign.Start)

        // 右侧
        Column() {
          this.customValue()
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.End)

        // 右侧箭头
        Column() {
          this.customRightIcon()
        }
        .padding({left: this.theme.spaceXs})
      }
      .constraintSize({
        minHeight: this.theme.heightMd,
      })
      .padding({top: this.theme.spaceMd, bottom: this.theme.spaceMd})
      .stateStyles({
        normal: {
          .backgroundColor(this.bgColor)
        },
        pressed: {
          .backgroundColor(this.clickable || this.isLink ? this.theme.lightGray : this.bgColor)
        }
      })
      .borderWidth({ bottom: this.bordered ? '1lpx' : 0 })
      .borderColor(this.theme.lightGray)
    }
    .width('100%')
    .padding({left: this.theme.spaceMd, right: this.theme.spaceMd})
    .backgroundColor(this.bgColor)
  }
}

export { WuCellGroup } from './cell-group'