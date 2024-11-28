import { WuBackTop } from '@itrain/wu-ui'

@Component
export default struct PageContainer {
  // 标题
  @Prop title: string
  // 是否可显示回到顶部按钮
  @Prop backTop: boolean = true
  // 默认页面内填充宽度
  @Prop defaultPadding: number = 8
  // 自定义主体内容布局
  @BuilderParam customContent: () => void

  @State backTopVisible: boolean = false

  // 滚动控制器，用于手动控制页面滚动逻辑
  scroller: Scroller = new Scroller()

  // 滚动事件函数
  onPageScroll?: () => void
  // 触底事件函数，用于处理页面滚动触底的逻辑
  onReachBottom?: () => void

  build() {
    NavDestination() {
      Stack() {
        /* 页面滚动容器 */
        Scroll(this.scroller) {
          // 渲染页面内容的布局
          this.customContent?.()
        }
        .width('100%')
        .height('100%')
        .align(Alignment.TopStart)
        .padding(this.defaultPadding)
        .onReachEnd(() => {
          this.onReachBottom?.()
        })
        .onDidScroll(() => {
          this.backTopVisible = this.scroller.currentOffset().yOffset >= 200
          this.onPageScroll?.()
        })

        /* 回到顶部按钮 */
        if (this.backTop && this.backTopVisible) {
          WuBackTop({
            visible: this.backTopVisible,
            scroller: this.scroller,
          })
        }
      }
      .width('100%')
      .height('100%')
    }
    .title(this.title)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background_color'))
  }
}
