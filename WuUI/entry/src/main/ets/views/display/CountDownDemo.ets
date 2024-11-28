import PageContainer from '../../components/PageContainer'

@Builder
export function renderCountDown() {
  CountDownDemo()
}

@Component
export struct CountDownDemo {
  build() {
    PageContainer({
      title: 'CountDown 倒计时',
    }) {

    }
  }
}