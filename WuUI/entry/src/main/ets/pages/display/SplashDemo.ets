@Builder
export function renderSplash() {
  SplashDemo()
}

@Component
export struct SplashDemo {
  build() {
    NavDestination() {

    }
    .title('Splash 过渡页')
  }
}