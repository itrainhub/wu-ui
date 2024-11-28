import PageContainer from '../../components/PageContainer'

@Builder
export function renderSearch() {
  SearchDemo()
}

@Component
export struct SearchDemo {
  build() {
    PageContainer({
      title: 'Search 搜索',
    }) {

    }
  }
}
