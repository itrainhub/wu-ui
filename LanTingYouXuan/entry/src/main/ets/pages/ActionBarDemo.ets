import { WuActionBar } from '@itrain/wu-ui';

@Entry
@Component
struct ActionBarDemo {
  @State message: string = 'Hello World';

  build() {
    Column() {
      WuActionBar({
        cartBadge: 922
      })
    }
    .height('100%')
    .width('100%')
  }
}