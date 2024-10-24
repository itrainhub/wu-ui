import { defaultStyles, WU_THEME_NAMESPACE } from "../../theme-chalk"
import { WuShape, WuThemeStyleRecord } from "../../theme-chalk/types"
import { noop } from "../../utils/Common"
import { WuLoading } from "../loading"
import { WuPopup } from "../popup"
import { ImageViewer } from "./image-viewer"

@Component
export struct WuImage {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  // 图片资源或地址
  @Prop @Watch('handlePreviewImage') src: ResourceStr
  // 图片加载时显示的占位图
  @Prop alt: ResourceStr // = $r('app.media.__wu_default_img')
  // 图片填充模式
  @Prop fit: ImageFit = ImageFit.Contain
  // 图片宽高
  @Prop imgWidth: Length = '640lpx'
  @Prop imgHeight: Length = '480lpx'
  // 圆角大小
  @Prop radius: Length = this.theme.borderRadiusSm
  // 形状
  @Prop shape: WuShape = 'square'
  // 加载出错时的图标
  @Prop errorIcon: ResourceStr = $r('app.media.__wu_default_img_err')
  // 是否可预览
  @Prop preview: boolean = false
  // 预览图像
  @Prop previewImage: ResourceStr = this.src
  // 是否显示加载提示
  @Prop showLoading: boolean = true
  // 是否显示错误提示
  @Prop showError: boolean = true
  // 预览图背景角色
  @Prop previewBackgroundColor: ResourceColor

  // 预览弹窗显隐状态
  @State previewVisible: boolean = false
  // 是否有加载错误
  @State isError: boolean = false

  onLoad: () => void = noop
  onError: () => void = noop

  @BuilderParam customLoading: () => void = this._renderLoading
  @BuilderParam customError: () => void = this._renderError

  // 无预览图像设置时与原始图像一致
  handlePreviewImage() {
    if (!this.previewImage) {
      this.previewImage = this.src
    }
  }

  /**
   * 渲染预览图片
   */
  @Builder
  _renderPreview() {
    Column() {
      ImageViewer({
        imageResource: this.previewImage,
        bgColor: this.previewBackgroundColor,
      })
        .onClick(() => {
          this.previewVisible = false
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  /**
   * 渲染加载提示
   */
  @Builder
  _renderLoading() {
    WuLoading()
  }

  @Builder
  _renderError() { }

  @Styles
  box() {
    .width(this.imgWidth)
    .height(this.shape === 'round' ? this.imgWidth : this.imgHeight)
  }

  build() {
    Stack() {
      Column() {
        if (this.src) {
          Image(this.src)
            .box()
            .objectFit(this.fit)
            .alt(this.alt)
            .borderRadius(this.shape === 'round' ? '50%' : this.radius)
            // .syncLoad(true)
            .onComplete(() => {
              this.showLoading = false
              this.onLoad()
            })
            .onError(() => {
              this.src = this.showError ? this.errorIcon : ''
              this.isError = true
              this.showLoading = false
              this.onError()
            })
            .onClick(() => {
              if (this.preview && !this.isError) {
                this.previewVisible = true
              }
            })
            .clip(true)
        }

        if (!this.isError) {
          WuPopup({
            visible: this.previewVisible,
            popupWidth: '100%',
            popupHeight: '100%',
            customContent: () => { this._renderPreview() },
          })
        }
      }
      .box()
      .backgroundColor(this.showLoading ? this.theme.ghostWhite : Color.Transparent)

      if (this.showError && this.isError) {
        this.customError()
      }

      if (this.showLoading) {
        this.customLoading()
      }
    }
    .box()
  }
}