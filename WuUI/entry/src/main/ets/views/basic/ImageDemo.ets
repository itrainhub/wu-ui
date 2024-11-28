import { WuImage } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderImage() {
  ImageDemo()
}

@Component
export struct ImageDemo {
  @State src: string = ''

  aboutToAppear(): void {
    setTimeout(() => {
      this.src = 'https://developer.huawei.com/allianceCmsResource/resource/HUAWEI_Developer_VUE/images/pc1010.jpg'
    }, 2000)
  }

  build() {
    PageContainer({
      title: 'Image 图片',
    }) {
      Column() {
        WuImage({
          // src: $r('app.media.splash2'),
          // src: this.src,
          src: 'https://developer.huawei.com/allianceCmsResource/resource/HUAWEI_Developer_VUE/images/pc1010.jpg',
          preview: true,
          // fit: ImageFit.Fill,
          // shape: 'round',
          imgWidth: 100,
          imgHeight: 50,
          previewBackgroundColor: Color.Pink,
          // errorIcon: '',
        })
      }
    }
  }
}