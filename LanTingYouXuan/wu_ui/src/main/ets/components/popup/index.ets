import { BorderRadiuses } from '@ohos.arkui.node'
import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { noop } from '../../utils/Common'
import WuGlobalData from '../../utils/GlobalData'
import { WuIcon } from '../icon'

// 位置
type WuDialogPlacement = 'top' | 'bottom' | 'left' | 'right' | 'center'

/**
 * 可见性控制器
 */
class WuVisibilityController {
  show = () => {}
  hide = () => {}
}

@CustomDialog
@Component
struct WuPopupDialog {
  dialogController?: CustomDialogController
  visibilityController?: WuVisibilityController
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  // 位置
  @Prop placement: WuDialogPlacement = 'center'
  // 是否圆角
  @Prop round: boolean = false
  // 是否进行安全区适配
  @Prop safeAreaInsetTop: boolean = false
  @Prop safeAreaInsetBottom: boolean = false
  // 动画时长
  @Prop duration: number
  // 是否显示关闭按钮
  @Prop closeable: boolean = false
  // 弹窗宽高
  @Prop popupWidth: Length
  @Prop popupHeight: Length
  // 显示状态
  @State showFlag: Visibility = Visibility.Visible
  // 圆角
  @State connerRadius: BorderRadiuses | Dimension = 0
  @BuilderParam customContent: () => void = this._renderContent

  onCloseClick: () => void = noop

  aboutToAppear(): void {
    this.calcDialogSize()
    this.calcCornerRadius()
    if (this.visibilityController) {
      this.visibilityController.hide = () => {
        this.showFlag = Visibility.Hidden
      }
    }
  }

  /**
   * 计算对话框宽高
   */
  calcDialogSize() {
    if (typeof this.popupWidth === 'undefined') {
      if (this.placement === 'center') {
        this.popupWidth = Math.floor(WuGlobalData.screenWidth * 0.4)
      } else if (this.placement === 'left' || this.placement === 'right') {
        this.popupWidth = Math.floor(WuGlobalData.screenWidth * 0.4)
      } else {
        this.popupWidth = '100%'
      }
    }

    if (typeof this.popupHeight === 'undefined') {
      if (this.placement === 'center') {
        this.popupHeight = Math.floor(WuGlobalData.screenWidth * 0.4)
      } else if (this.placement === 'left' || this.placement === 'right') {
        this.popupHeight =
          WuGlobalData.screenHeight
            - (this.safeAreaInsetTop ? WuGlobalData.safeAreaInsetTop : 0)
            - (this.safeAreaInsetBottom ? WuGlobalData.safeAreaInsetBottom : 0)
      } else {
        this.popupHeight = Math.floor(WuGlobalData.screenHeight * 0.3)
      }
    }
  }

  /**
   * 根据是否圆角与定位位置，计算各方向圆角大小
   */
  calcCornerRadius() {
    const set = (topLeft: number, topRight: number, bottomLeft: number, bottomRight: number) => {
      this.connerRadius = {
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
      }
    }

    if (this.round) {
      if (this.placement === 'top') {
        set(0, 0, 8, 8)
      } else if (this.placement === 'bottom') {
        set(8, 8, 0, 0)
      } else if (this.placement === 'left') {
        set(0, 8, 0, 8)
      } else if (this.placement === 'right') {
        set(8, 0, 8, 0)
      } else {
        this.connerRadius = 8
      }
    } else {
      this.connerRadius = 0
    }
  }

  /**
   * 显示隐藏时的运动方向
   */
  getTransitionDir() {
    switch (this.placement) {
      case 'top':
        return TransitionEdge.TOP
      case 'bottom':
        return TransitionEdge.BOTTOM
      case 'left':
        return TransitionEdge.START
      case 'right':
        return TransitionEdge.END
      default:
        return undefined
    }
  }

  /**
   * 垂直定位偏移量
   * @returns
   */
  getOffsetY() {
    if (['top', 'left', 'right'].includes(this.placement)) {
      return this.safeAreaInsetTop ? WuGlobalData.safeAreaInsetTop : 0
    }
    if (this.placement === 'bottom') {
      return this.safeAreaInsetBottom ? -1 * WuGlobalData.safeAreaInsetBottom : 0
    }
    return 0
  }

  @Builder
  _renderContent() { }

  build() {
    Column() {
      Stack() {
        Column() {
          this.customContent()
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        // 右上角关闭按钮
        if (this.closeable) {
          WuIcon({ name: 'close' })
            .onClick(this.onCloseClick)
        }
      }
      .width('100%')
      .height('100%')
      .alignContent(Alignment.TopEnd)
    }
    .width(this.popupWidth)
    .height(this.popupHeight)
    // .constraintSize({
    //   minWidth: this.popupWidth,
    //   minHeight: this.popupHeight,
    // })
    .clip(true)
    .padding(this.theme.spaceSm)
    .borderRadius(this.connerRadius)
    .backgroundColor(Color.White)
    .visibility(this.showFlag)
    .offset({
      y: this.getOffsetY()
    })
    .transition(
      (
        this.placement === 'center'
          ? TransitionEffect.OPACITY
          : TransitionEffect.move(this.getTransitionDir())
      )
        .animation({
          duration: this.duration,
          curve: Curve.Linear,
        })
    )
  }
}

@Component
export struct WuPopup {
  // 可见性
  @Link @Watch('handleVisible') visible: boolean
  // 显示位置
  @Prop placement: WuDialogPlacement = 'center'
  // 是否显示圆角
  @Prop round: boolean = true
  // 弹窗宽高
  @Prop popupWidth: Length
  @Prop popupHeight: Length
  // 安全区
  @Prop safeAreaInsetTop: boolean = false
  @Prop safeAreaInsetBottom: boolean = false
  // 动画时长
  @Prop duration: number = 400
  // 是否添加遮罩
  @Prop maskable: boolean = true
  // 是否点击遮罩关闭
  @Prop maskClosable: boolean = true
  // 是否显示关闭按钮
  @Prop closeable: boolean = false

  @BuilderParam customContent: () => void = this._renderContent

  onOpen: () => void = noop
  onClose: () => void = noop

  visibilityController: WuVisibilityController = new WuVisibilityController()
  // 自定义对话框控制器
  dialogController?: CustomDialogController = new CustomDialogController({
    builder: WuPopupDialog({
      placement: this.placement,
      round: this.round,
      popupWidth: this.popupWidth,
      popupHeight: this.popupHeight,
      visibilityController: this.visibilityController,
      duration: this.duration,
      closeable: this.closeable,
      safeAreaInsetTop: this.safeAreaInsetTop,
      safeAreaInsetBottom: this.safeAreaInsetBottom,
      customContent: this.customContent,
      onCloseClick: () => {
        this.handleClose()
      }
    }),
    customStyle: true,
    isModal: this.maskable,
    alignment: this.calcAlignment(),
    onWillDismiss: (action) => {
      if (action.reason === DismissReason.TOUCH_OUTSIDE && this.maskClosable) {
        this.handleClose()
      }
    },
    cancel: () => {
      this.visible = false
    },
  })

  @Builder
  _renderContent() {
    Text('弹窗内容')
  }

  /**
   * 处理弹出层的显示与隐藏
   */
  handleVisible() {
    if (this.visible) {
      this.dialogController?.open()
      this.onOpen()
    } else {
      this.handleClose()
    }
  }

  /**
   * 处理关闭
   */
  handleClose() {
    this.visibilityController.hide()
    setTimeout(() => {
      this.visible = false
      this.dialogController?.close()
      this.onClose()
    }, this.duration - 50)
  }

  /**
   * 定位位置
   */
  calcAlignment() {
    console.log('this.placement:', this.placement)
    return this.placement === 'top' ? DialogAlignment.Top :
      this.placement === 'bottom' ? DialogAlignment.Bottom :
        this.placement === 'left' ? DialogAlignment.TopStart :
          this.placement === 'right' ? DialogAlignment.TopEnd : DialogAlignment.Center
  }

  build() {
  }
}