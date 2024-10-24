@Builder
export function renderGrid() {
  GridDemo()
}

@Component
export struct GridDemo {
  build() {
    NavDestination() {

    }
    .title('Grid 宫格')
  }
}