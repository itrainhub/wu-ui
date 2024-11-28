import { WuCard, WuCell, WuSwipeCell } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderSwipeCell() {
  SwipeCellDemo()
}

@Component
export struct SwipeCellDemo {
  @Builder
  renderBasicContent() {
    WuCell({
      title: '单元格',
      value: '内容',
      bordered: false,
    })
  }

  @Builder
  renderBasicLeft() {
    Button('选择')
      .type(ButtonType.Normal)
      .height('100%')
  }

  @Builder
  renderBasicRight() {
    Row() {
      Button('删除')
        .type(ButtonType.Normal)
        .backgroundColor(Color.Red)
        .height('100%')
      Button('收藏')
        .type(ButtonType.Normal)
        .height('100%')
    }
  }

  @Builder
  renderCustomContent() {
    WuCard({
      thumb: $r('app.media.banner1'),
      title: '这是商品标题',
      price: 9.9,
      num: 18,
      tag: 'hot'
    })
  }
  @Builder
  renderCustomRight() {
    Button('删除')
      .type(ButtonType.Normal)
      .backgroundColor(Color.Red)
      .height('100%')
  }

  build() {
    PageContainer({
      title: 'SwipeCell 滑动单元格',
    }) {
      Column({space: 8}) {
        Column({space: 8}) {
          Text('基础用法')
            .fontSize('14fp')
            .fontColor(Color.Gray)
            .width('100%')
            .padding(8)
          WuSwipeCell({
            customLeft: this.renderBasicLeft,
            customContent: this.renderBasicContent,
            customRight: this.renderBasicRight,
          })
        }

        Column({space: 8}) {
          Text('自定义内容')
            .fontSize('14fp')
            .fontColor(Color.Gray)
            .width('100%')
            .padding(8)
          WuSwipeCell({
            customContent: this.renderCustomContent,
            customRight: this.renderCustomRight,
          })
        }
      }
      .width('100%')
    }
  }
}