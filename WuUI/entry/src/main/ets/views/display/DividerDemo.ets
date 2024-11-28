import PageContainer from '../../components/PageContainer'

@Builder
export function renderDivider() {
  DividerDemo()
}

@Component
export struct DividerDemo {
  build() {
    PageContainer({
      title: 'Divider 分割线',
    }) {

    }
  }
}