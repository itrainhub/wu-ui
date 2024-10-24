import { WuCell, WuCellGroup } from '@itrain/wu-ui';

@Entry
@Component
struct CellDemo {
  @State message: string = 'Hello World';

  @Builder
  _renderContent() {
    WuCell({
      icon: 'home',
      title: '标题',
      label: '这是一段描述信息这是一段描述信息这是一段描述信息这是一段描述信息这是一段描述信息这是一段描述信息',
      value: '这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容',
      isLink: true,
    })
    WuCell({
      icon: 'home',
      title: '标题',
      label: '这是一段描述信息',
      value: '这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容',
      clickable: true,
      bordered: false,
    })
  }

  build() {
    Column() {
      WuCellGroup({
        bordered: false,
        title: '分组名称',
        inset: true,
        bgColor: Color.Transparent,
        customContent: this._renderContent,
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#eaeaea')
  }
}