import { WuEmpty } from '@itrain/wu-ui';

@Builder
export function renderEmpty() {
  EmptyDemo()
}

@Component
export struct EmptyDemo {

  build() {
    NavDestination() {
      Column() {
        WuEmpty({
          description: '购物车是空的哟'
        })
      }
      .height('100%')
      .width('100%')
    }
    .title('Empty 空状态')
  }
}