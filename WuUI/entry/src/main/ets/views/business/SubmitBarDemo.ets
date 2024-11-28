import { WuSubmitBar } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderSubmitBar() {
  SubmitBarDemo()
}

@Component
export struct SubmitBarDemo {
  @State message: string = 'Hello World';

  @Builder
  _renderTip() {
    Text('您所在的地区不支持货到付款, 请在线支付, 您支付完成后会在24小时以内安排发货!')
      .fontSize(12)
  }

  build() {
    PageContainer({
      title: 'SubmitBar 提交订单栏',
    }) {
      Column() {
        WuSubmitBar({
          // checkAll: false,
          checked: true,
          price: 399,
          tip: '您所在的地区不支持货到付款, 请在线支付, 您支付完成后会在24小时以内安排发货!',
          // customTip: this._renderTip,
          onCheckedChange: (checked: boolean) => {
            console.log('改了嘛:', checked)
          }
        })
      }
      .width('100%')
    }
  }
}