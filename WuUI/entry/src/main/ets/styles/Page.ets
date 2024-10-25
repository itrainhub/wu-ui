export class ContainerModifier<Attribute extends CommonAttribute> implements AttributeModifier<Attribute> {
  private page: boolean

  // page: 是否页面容器
  constructor(page: boolean = false) {
    this.page = page
  }

  applyNormalAttribute(instance: Attribute): void {
    instance
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
    if (this.page) {
      instance.backgroundColor($r('app.color.page_background_color'))
    } else {
      instance.padding(16)
    }
  }

  setBg(instance: Attribute) {
    instance.backgroundColor($r('app.color.page_background_color'))
  }
}
