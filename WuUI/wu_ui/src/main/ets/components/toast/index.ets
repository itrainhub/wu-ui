import { ComponentContent } from '@kit.ArkUI'
import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { isValidUrl, noop } from '../../utils/Common'
import WuGlobalData from '../../utils/GlobalData'
import ObjectUtil from '../../utils/ObjectUtil'
import { WuIcon } from '../icon'
import { WuLoading } from '../loading'

type WuToastType = 'success' | 'fail' | 'loading' | 'text'
type WuToastPlacement = 'top' | 'bottom' | 'center'

interface WuToastOption {
  message: string
  icon: string
  iconSize: Length
  type: WuToastType
  placement: WuToastPlacement
  overlay: boolean
  duration: number
  loadingType: 'circular' | 'spinner'
  wordBreak: WordBreak
  forbidClick: boolean
  onOpen: () => void
  onClose: () => void
}

interface WuRenderToastParam {
  options: WuToastOption
  theme: WuThemeStyleRecord
}

interface  WuToastPosition {
  alignment: DialogAlignment
  offset: Offset
}

/**
 * 渲染成功、失败、加载图标，否则如果有用户传递 icon 则渲染用户图标
 * @param type
 * @param name
 * @param iconSize
 * @param color
 */
@Builder
function renderIcon(type: WuToastType, name: string, iconSize: Length, loadingType: 'circular' | 'spinner', color: ResourceColor) {
  if (type === 'success') {
    WuIcon({ name: 'check', iconSize, color })
  } else if (type === 'fail') {
    WuIcon({ name: 'warn', iconSize, color })
  } else if (type === 'loading') {
    WuLoading({
      iconSize,
      type: loadingType,
    })
  } else if (name) {
    if (isValidUrl(name)) {
      Image(name)
        .width(iconSize)
        .aspectRatio(1)
    } else {
      WuIcon({ name, iconSize, color })
    }
  }
}

@Builder
function renderToast(params: WuRenderToastParam) {
  Column({space: params.theme.spaceMd as string}) {
    // 渲染图标
    renderIcon(
      params.options.type,
      params.options.icon,
      params.options.iconSize,
      params.options.loadingType,
      params.theme.ghostWhite,
    )
    // 渲染文本
    Text(params.options.message)
      .fontSize(params.theme.fontSizeMd)
      .fontWeight(FontWeight.Bold)
      .fontColor(params.theme.ghostWhite)
      .wordBreak(params.options.wordBreak)
      .textAlign(TextAlign.Center)
  }
  .constraintSize({
    minWidth: '240lpx',
    maxWidth: '80%',
  })
  .padding(params.theme.spaceMd)
  .clip(true)
  .backgroundColor('rgba(0, 0, 0, 0.5)')
  .shadow(ShadowStyle.OUTER_DEFAULT_MD)
}

class WuToastClass {
  private contentNode?: ComponentContent<Object>
  private ctx?: UIContext
  private theme: WuThemeStyleRecord = AppStorage.get(WU_THEME_NAMESPACE) ?? defaultStyles
  private timer: number = 0
  private defaultOptions: WuToastOption = {
    message: '',
    icon: '',
    duration: 2000,
    placement: 'center',
    overlay: false,
    type: 'text',
    iconSize: '128lpx',
    loadingType: 'circular',
    wordBreak: WordBreak.NORMAL,
    forbidClick: false,
    onOpen: noop,
    onClose: noop,
  }
  private onClose?: () => void

  getPlacement(placement?: WuToastPlacement): WuToastPosition {
    let alignment: DialogAlignment = DialogAlignment.Center
    let offset: Offset = { dx: 0, dy: 0 }

    if (placement === 'top') {
      alignment = DialogAlignment.Top
      offset = { dx: 0, dy: 48 }
    } else if (placement === 'bottom') {
      alignment = DialogAlignment.Bottom
      offset = { dx: 0, dy: -48 }
    }

    return {
      alignment,
      offset
    }
  }

  /**
   * 显示提示效果
   * @param options
   */
  showToast(options: Partial<WuToastOption> | string) {
    if (!this.ctx) {
      this.ctx = WuGlobalData.context
    }

    // 选项处理
    if (typeof options === 'string') {
      options = ObjectUtil.assign({}, this.defaultOptions, {message: options})
    } else {
      options = ObjectUtil.assign({}, this.defaultOptions, options)
    }
    // 关闭回调赋值
    this.onClose = options.onClose

    // 先关闭已有轻提示
    clearTimeout(this.timer)
    this.closeToast()
    // 内容节点
    this.contentNode =
      new ComponentContent(this.ctx, wrapBuilder(renderToast), {options, theme: this.theme} as WuRenderToastParam)

    // 定位
    const align: WuToastPosition = this.getPlacement(options.placement)
    // 打开自定义对话框
    this.ctx.getPromptAction().openCustomDialog(this.contentNode, {
      isModal: options.overlay,
      autoCancel: !options.forbidClick,
      alignment: align.alignment,
      offset: align.offset,
    }).then(() => {
      // 打开时执行的回调
      (options as WuToastOption).onOpen?.()
      // 设置 duration 时间为0则不自动关闭
      if ((options as WuToastOption).duration !== 0) {
        this.timer = setTimeout(() => {
          this.closeToast()
        }, (options as WuToastOption).duration)
      }
    })
  }

  /**
   * 加载提示
   */
  showLoadingToast(options: Partial<WuToastOption> | string) {
    options = typeof options === 'string' ? {message: options} as WuToastOption : options
    options.type = 'loading'
    this.showToast(options)
  }

  /**
   * 成功提示
   */
  showSuccessToast(options: Partial<WuToastOption> | string) {
    options = typeof options === 'string' ? {message: options} as WuToastOption : options
    options.type = 'success'
    this.showToast(options)
  }

  /**
   * 失败提示
   */
  showFailToast(options: Partial<WuToastOption> | string) {
    options = typeof options === 'string' ? {message: options} as WuToastOption : options
    options.type = 'fail'
    this.showToast(options)
  }

  /**
   * 关闭提示效果
   */
  closeToast() {
    if (this.contentNode) {
      this.ctx?.getPromptAction().closeCustomDialog(this.contentNode).then(() => {
        this.onClose?.()
      })
    }
  }
}

export const WuToast = new WuToastClass()
