import { WuCell, WuCellGroup, WuToast } from '@itrain/wu-ui'
import { ContainerModifier } from '../../styles/Page'

@Builder
function renderToast() {
  ToastDemo()
}

@Component
export struct ToastDemo {

  /**
   * 渲染基础用法
   */
  @Builder
  renderBasic() {
    WuCell({
      title: '文字提示',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast('文字提示')
      })
    WuCell({
      title: '加载提示',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showLoadingToast('加载提示')
        // WuToast.showToast({
        //   message: '加载提示',
        //   type: 'loading'
        // })
      })
    WuCell({
      title: '成功提示',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showSuccessToast('成功提示')
        // WuToast.showToast({
        //   message: '成功提示',
        //   type: 'success'
        // })
      })
    WuCell({
      title: '失败提示',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showFailToast('失败提示')
        // WuToast.showToast({
        //   message: '失败提示',
        //   type: 'fail'
        // })
      })
  }

  /**
   * 渲染自定义图标
   */
  @Builder
  renderIcon() {
    WuCell({
      title: '自定义图标',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '自定义图标',
          icon: 'appreciate',
        })
      })
    WuCell({
      title: '自定义图片',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '自定义图片',
          icon: 'https://developer.huawei.com/allianceCmsResource/resource/HUAWEI_Developer_VUE/images/0417/home-new-12.png',
        })
      })
    WuCell({
      title: '自定义加载图标',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '自定义加载图标',
          type: 'loading',
          loadingType: 'spinner',
        })
      })
  }

  /**
   * 渲染自定义位置
   */
  @Builder
  renderPosition() {
    WuCell({
      title: '顶部展示',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '顶部展示',
          placement: 'top',
        })
      })
    WuCell({
      title: '底部展示',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '底部展示',
          placement: 'bottom',
        })
      })
  }

  /**
   * 渲染文字换行方式
   */
  @Builder
  renderWordBreak() {
    WuCell({
      title: '换行时截断单词',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: 'This message will contain a incomprehensibilities long word.',
          placement: 'bottom',
          wordBreak: WordBreak.BREAK_ALL,
        })
      })
    WuCell({
      title: '换行时不截断单词',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: 'This message will contain a incomprehensibilities long word.',
          placement: 'bottom',
          wordBreak: WordBreak.BREAK_WORD,
        })
      })
  }

  /**
   * 渲染遮罩
   */
  @Builder
  renderOverlay() {
    WuCell({
      title: '显示遮罩',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '显示遮罩',
          overlay: true,
        })
      })
    WuCell({
      title: '禁止点击遮罩',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '禁止点击遮罩',
          type: 'fail',
          overlay: true,
          forbidClick: true,
        })
      })
  }

  @Builder
  renderDuration() {
    WuCell({
      title: '5秒自动关闭',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '5秒自动关闭',
          type: 'success',
          duration: 5000,
        })
      })
    WuCell({
      title: '手动关闭',
      isLink: true,
    })
      .onClick(() => {
        WuToast.showToast({
          message: '手动关闭',
          type: 'loading',
          duration: 0,
          onOpen: () => {
            // 模拟3秒手动关闭
            setTimeout(() => {
              WuToast.closeToast()
            }, 3000)
          }
        })
      })
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          WuCellGroup({
            title: '基础用法',
            customContent: this.renderBasic,
            inset: true,
          })

          WuCellGroup({
            title: '自定义图标',
            customContent: this.renderIcon,
            inset: true,
          })

          WuCellGroup({
            title: '自定义位置',
            customContent: this.renderPosition,
            inset: true,
          })

          WuCellGroup({
            title: '文字换行方式',
            customContent: this.renderWordBreak,
            inset: true,
          })

          WuCellGroup({
            title: '遮罩',
            customContent: this.renderOverlay,
            inset: true,
          })

          WuCellGroup({
            title: '展示时长',
            customContent: this.renderDuration,
            inset: true,
          })
        }
      }
      .attributeModifier(new ContainerModifier<ScrollAttribute>())
    }
    .title('Toast 轻提示')
  }
}