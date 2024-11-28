import { WuLoading } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

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
    PageContainer({
      title: 'Loading 加载',
    }) {
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
      .width('100%')
    }
  }
}
