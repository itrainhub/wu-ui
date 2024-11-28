import { WuSignature } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

interface SignatureOptions {
  penColor: string
  lineWidth: number
  bgColor: string
  onOk: (image: string) => void
}

@Builder
function renderSignature() {
  SignatureDemo()
}

@Component
struct SignatureDemo {
  @State image: string = ''

  /**
   * 通用渲染
   */
  @Builder
  _renderCommon(title: string, options: Partial<SignatureOptions>) {
    Column({ space: 8 }) {
      Text(title)
        .fontColor(Color.Gray)

      WuSignature(options)
        .height(200)
    }
    .width('100%')
    .margin({ top: 16 })
    .alignItems(HorizontalAlign.Start)
  }

  /**
   * 基础用法
   */
  @Builder
  _renderBasic() {
    this._renderCommon('基础用法', {
      onOk: image => {
        this.image = image
      }
    })
  }

  /**
   * 自定义画笔颜色
   */
  @Builder
  _renderPenColor() {
    this._renderCommon('自定义画笔颜色', {
      penColor: '#df1131',
      onOk: image => {
        this.image = image
      }
    })
  }

  /**
   * 自定义线宽
   */
  @Builder
  _renderLineWidth() {
    this._renderCommon('自定义画笔线宽', {
      lineWidth: 10,
      onOk: image => {
        this.image = image
      }
    })
  }

  /**
   * 自定义背景颜色
   */
  @Builder
  _renderBgColor() {
    this._renderCommon('自定义背景颜色', {
      bgColor: '#cccccc',
      onOk: image => {
        this.image = image
      }
    })
  }

  build() {
    PageContainer({
      title: 'Signature 签名',
      defaultPadding: 16,
      backTop: false,
    }) {
      Column() {

        if (this.image) {
          Text('预览签名效果:')
            .width('100%')

          Image(this.image)
            .width('100%')
            .height(200)
            .objectFit(ImageFit.Fill)
        }

        this._renderBasic()

        this._renderPenColor()

        this._renderLineWidth()

        this._renderBgColor()
      }
      .width('100%')
    }
  }
}
