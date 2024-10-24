import { WuLoading } from '@itrain/wu-ui'

@Builder
export function renderLoading() {
  LoadingDemo()
}

@Component
export struct LoadingDemo {
  @Builder
  _renderIcon() {
    Text('这是一个图标')
  }

  @Builder
  _renderText() {
    Text('就是文本......')
  }

  build() {
    NavDestination() {
      Column() {
        WuLoading({
          // iconSize: 64,
          text: '加载中...',
          color: '#f00',
          vertical: true,
          // customIcon: this._renderIcon,
          // customText: this._renderText,
        })
      }
      .height('100%')
      .width('100%')
    }
    .title('Loading 加载')
  }
}
