import PageContainer from '../../components/PageContainer'

@Builder
export function renderIcon() {
  IconDemo()
}

@Component
export struct IconDemo {
  build() {
    PageContainer({
      title: 'Icon 图标',
    }) {

    }
  }
}