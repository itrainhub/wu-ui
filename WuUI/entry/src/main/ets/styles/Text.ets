export class TitleFontModifier implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .width('100%')
      .fontSize('14fp')
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Gray)
  }
}
