@Builder
export function renderButton() {
  ButtonDemo()
}

@Component
export struct ButtonDemo {
  build() {
    NavDestination() {
      Text('这是测试按钮')
    }
    .title('Button 按钮')
  }
}