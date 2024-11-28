import PageContainer from '../../components/PageContainer'

@Builder
export function renderSplash() {
  SplashDemo()
}

@Component
export struct SplashDemo {
  build() {
    PageContainer({
      title: 'Splash 过渡页'
    }) {

    }
  }
}