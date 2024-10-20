import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuThemeStyleRecord } from "../../theme-chalk/types"
import { getCode } from "./data"

@Component
export struct WuIcon {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  @Prop name: string = ''
  @Prop iconSize: ResourceStr | number = this.theme.fontSizeLg
  @Prop color: ResourceColor = this.theme.deepGray

  build() {
    Text(getCode(this.name))
      .fontSize(this.iconSize)
      .fontFamily('wuicon')
      .fontColor(this.color)
  }
}