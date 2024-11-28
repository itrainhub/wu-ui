import { WuEmpty } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderEmpty() {
  EmptyDemo()
}

@Component
export struct EmptyDemo {

  build() {
    PageContainer({
      title: 'Empty 空状态',
    }) {
      Column() {
        WuEmpty({
          description: '购物车是空的哟'
        })
      }
      .width('100%')
    }
  }
}