import { WuLoading } from '@itrain/wu-ui'

@Entry
@Component
struct LoadingPage {

  @Builder
  _renderIcon() {
    Text('这是一个图标')
  }

  @Builder
  _renderText() {
    Text('就是文本......')
  }

  build() {
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
}