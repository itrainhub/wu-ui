import { WuPopup } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderPopup() {
  PopupDemo()
}

@Component
export struct PopupDemo {
  @State visible: boolean = false
  @State placement: 'top' | 'bottom' | 'left' | 'right' | 'center' = 'right'

  @Builder
  _renderContent() {
    Column() {
      Text('删除提示:')
      Text('是否删除当前的内容呢?')
      Row() {
        Button('否').onClick(() => {
          this.visible = false
        })
        Button('是').onClick(() => {
          this.visible = false
        })
      }
    }
    .width('100%')
    .height('100%')
  }

  build() {
    PageContainer({
      title: 'Popup 弹出层',
    }) {
      Column() {
        Button('显隐' + this.visible).onClick((event: ClickEvent) => {
          this.visible = !this.visible
        })

        WuPopup({
          visible: this.visible,
          placement: 'left',
          duration: 200,
          closeable: false,
          // round: true,
          // maskClosable: false,
          // safeAreaInsetTop: true,
          // safeAreaInsetBottom: true,
          popupWidth: 300,
          // popupHeight: 200,
          customContent: () => {
            this._renderContent()
          },
          onOpen: () => {
            console.log('打开咯...')
          },
          onClose: () => {
            console.log('关瓜了...')
          }
        })
      }
      .height('100%')
      .width('100%')
    }
  }
}
