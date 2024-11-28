import { WuActionBar } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderActionBar() {
  ActionBarDemo()
}

@Component
export struct ActionBarDemo {
  build() {
    PageContainer( {
      title: 'ActionBar 商品动作栏',
    }) {
      Column() {
        WuActionBar({
          cartBadge: 922
        })
      }
      .width('100%')
    }
  }
}
