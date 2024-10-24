@Builder
export function renderDivider() {
  DividerDemo()
}

@Component
export struct DividerDemo {
  build() {
    NavDestination() {

    }
    .title('Divider 分割线')
  }
}