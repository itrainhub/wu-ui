import PageContainer from '../../components/PageContainer'

@Builder
export function renderBackTop() {
  BackTopDemo()
}

@Component
export struct BackTopDemo {
  build() {
    PageContainer({
      title: 'BackTop 回到顶部',
    }) {

    }
  }
}