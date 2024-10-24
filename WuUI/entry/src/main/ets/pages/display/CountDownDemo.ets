@Builder
export function renderCountDown() {
  CountDownDemo()
}

@Component
export struct CountDownDemo {
  build() {
    NavDestination() {

    }
    .title('CountDown 倒计时')
  }
}