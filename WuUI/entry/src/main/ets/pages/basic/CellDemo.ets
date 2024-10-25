import { WuCell, WuCellGroup } from '@itrain/wu-ui'

@Extend(Text)
function title() {
  .fontSize('14fp')
  .fontWeight(FontWeight.Bold)
  .fontColor(Color.Gray)
  .width('100%')
}

@Builder
export function renderCell() {
  CellDemo()
}

@Component
export struct CellDemo {
  @Builder
  _renderContent() {
    WuCell({
      icon: 'home',
      title: '标题',
      label: '这是一段描述信息这是一段描述信息这是一段描述信息这是一段描述信息这是一段描述信息这是一段描述信息',
      value: '这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容这是取值内容',
      isLink: true,
    })
    WuCell({
      icon: 'home',
      title: '标题',
      label: '这是一段描述信息',
      value: '这是取值内容这是取值内容这是取值内容这是取值内容内容这是取值内容这是取值内容这是取值内容',
      clickable: true,
      bordered: false,
    })
  }

  build() {
    NavDestination() {
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
    .title('Cell 单元格')
  }
}