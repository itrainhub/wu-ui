export class ContainerModifier<Attribute extends CommonAttribute> implements AttributeModifier<Attribute> {
  private inset: boolean

  // inset: 是否页面容器
  constructor(inset: boolean = false) {
    this.inset = inset
  }

  applyNormalAttribute(instance: Attribute): void {
    instance
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
      .backgroundColor($r('app.color.page_background_color'))
    if (this.inset) {
      instance.padding(16)
    }
  }
}
