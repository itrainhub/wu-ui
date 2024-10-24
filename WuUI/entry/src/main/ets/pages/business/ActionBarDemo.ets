import { WuActionBar } from '@itrain/wu-ui';

@Builder
export function renderActionBar() {
  ActionBarDemo()
}

@Component
export struct ActionBarDemo {
  build() {
    NavDestination() {
      Column() {
        WuActionBar({
          cartBadge: 922
        })
      }
      .height('100%')
      .width('100%')
    }
    .title('ActionBar 商品动作栏')
  }
}
