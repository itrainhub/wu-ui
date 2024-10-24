@Builder
export function renderSearch() {
  SearchDemo()
}

@Component
export struct SearchDemo {
  build() {
    NavDestination() {

    }
    .title('Search 搜索')
  }
}
