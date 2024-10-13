import { getCode } from "./data"

@Component
export struct WuIcon {
  @Prop name: string = ''
  @Prop fontSize: ResourceStr | number = 16
  @Prop color: ResourceColor = Color.Black

  build() {
    Text(getCode(this.name))
      .fontSize(this.fontSize)
      .fontFamily('wuicon')
      .fontColor(this.color)
  }
}