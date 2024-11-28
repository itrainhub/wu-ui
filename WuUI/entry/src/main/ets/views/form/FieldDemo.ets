import PageContainer from '../../components/PageContainer'

@Builder
export function renderField() {
  FieldDemo()
}

@Component
export struct FieldDemo {
  build() {
    PageContainer({
      title: 'Field 输入框',
    }) {

    }
  }
}