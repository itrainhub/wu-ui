@Builder
export function renderField() {
  FieldDemo()
}

@Component
export struct FieldDemo {
  build() {
    NavDestination() {

    }
    .title('Field 输入框')
  }
}