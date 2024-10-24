@Builder
export function renderBackTop() {
  BackTopDemo()
}

@Component
export struct BackTopDemo {
  build() {
    NavDestination() {

    }
    .title('BackTop 回到顶部')
  }
}