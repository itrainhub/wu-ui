import { WuEmpty } from '@itrain/wu-ui';

@Entry
@Component
struct EmptyDemo {

  build() {
    Column() {
      WuEmpty({
        description: '购物车是空的哟'
      })
    }
    .height('100%')
    .width('100%')
  }
}