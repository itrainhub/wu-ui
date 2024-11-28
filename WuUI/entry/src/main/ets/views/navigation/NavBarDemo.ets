import { WuCellGroup, WuIcon, WuNavBar } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderNavBar() {
  NavBarDemo()
}

interface NavBarOptions {
  title: string
  back: boolean
  leftText: string
  rightText: string
  leftArrow: boolean
  customRight: () => void
  customLeft: () => void
}

@Component
export struct NavBarDemo {
  /**
   * 通用渲染
   */
  @Builder
  _renderCommon(title: string, options: Partial<NavBarOptions>) {
    Column({space: 8}) {
      Text(title)
        .fontColor(Color.Gray)
        .padding({left: 16})

      WuNavBar(options)
    }
    .width('100%')
    .margin({top: 16})
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * 基本用法
   */
  @Builder
  _renderBasic() {
    this._renderCommon('基本用法', { title: '标题' })
  }

  /**
   * 返回上级
   */
  @Builder
  _renderBack() {
    this._renderCommon('返回上级', { title: '标题', leftText: '返回', leftArrow: true })
  }

  /**
   * 右侧按钮
   */
  @Builder
  _renderRight() {
    this._renderCommon('右侧按钮', { title: '标题', leftText: '返回', leftArrow: true, rightText: '按钮' })
  }

  /**
   * 自定义右侧按钮
   */
  @Builder
  _customRight() {
    WuIcon({
      name: 'search',
    })
  }
  @Builder
  _renderCustomRight() {
    this._renderCommon('自定义右侧按钮', {
      title: '标题',
      leftText: '返回',
      leftArrow: true,
      customRight: this._customRight,
    })
  }

  /**
   * 自定义左侧按钮
   */
  @Builder
  _customLeft() {
    Row({space: 4}) {
      WuIcon({
        name: 'home',
      })
      Text('主页')
        .fontSize(16)
    }
  }
  @Builder
  _renderCustomLeft() {
    this._renderCommon('自定义左侧按钮', {
      title: '标题',
      leftText: '返回',
      leftArrow: true,
      customLeft: this._customLeft,
    })
  }

  build() {
    PageContainer({
      title: 'NavBar 导航栏',
      defaultPadding: 0,
    }) {
      Column() {
        this._renderBasic()
        this._renderBack()
        this._renderRight()
        this._renderCustomRight()
        this._renderCustomLeft()
      }
      .width('100%')
    }
  }
}