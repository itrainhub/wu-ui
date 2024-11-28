import PageContainer from '../../components/PageContainer'

@Builder
export function renderGrid() {
  GridDemo()
}

@Component
export struct GridDemo {
  build() {
    PageContainer({
      title: 'Grid 宫格',
    }) {

    }
  }
}