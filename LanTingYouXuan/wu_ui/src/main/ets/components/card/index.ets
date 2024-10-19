import { router } from '@kit.ArkUI'
import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { noop } from '../../utils/Common'
import { WuCardProps } from './types'

interface WuPricePart {
  integerPart: string
  decimalPart: string
}

@Component
export struct WuCard {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles

  @Prop title: string = ''
  @Prop desc: string = ''
  @Prop thumb: ResourceStr = $r('app.media.__wu_default_img')
  @Prop thumbLink: string = ''
  @Prop price: number = 0
  @Prop originPrice: number = 0
  @Prop num: number = 0
  @Prop currency: string = '¥'
  @Prop tag: string = ''

  onClickThumb: () => void = noop

  @BuilderParam customTitle: () => void = this.renderTitle
  @BuilderParam customDesc: () => void = this.renderDesc
  @BuilderParam customThumb: () => void = this.renderThumb
  @BuilderParam customPrice: () => void = this.renderPrice
  @BuilderParam customOriginPrice: () => void = this.renderOriginPrice
  @BuilderParam customNum: () => void = this.renderNum
  @BuilderParam customFooter: () => void = this.renderFooter
  @BuilderParam customTag: () => void = this.renderTag

  private splitPrice(price: number): WuPricePart {
    const parts: string[] = price.toFixed(2).split('.')
    return {
      integerPart: parts[0],
      decimalPart: parts[1],
    }
  }

  @Builder
  renderThumb() {
    Column() {
      Image(this.thumb)
        .width('100%')
        .aspectRatio(1)
        .objectFit(ImageFit.Fill)
        .onClick(() => {
          this.onClickThumb()
          this.thumbLink && router.pushUrl({
            url: this.thumbLink,
          })
        })
    }
    .width('160lpx')
    .aspectRatio(1)
    .padding(this.theme.spaceXs)
  }

  @Builder
  renderTitle() {
    Text(this.title)
      .fontSize(this.theme.fontSizeMd)
      .fontWeight(FontWeight.Bold)
      .maxLines(1)
      .textOverflow({overflow: TextOverflow.Ellipsis})
  }

  @Builder
  renderDesc() {
    Text(this.desc)
      .fontSize(this.theme.fontSizeSm)
      .fontColor(this.theme.gray)
      .maxLines(2)
      .textOverflow({overflow: TextOverflow.Ellipsis})
  }

  @Builder
  renderPrice() {
    Text() {
      Span(this.currency)
        .fontSize(this.theme.fontSizeSm)
      Span(this.splitPrice(this.price).integerPart)
        .fontSize(this.theme.fontSizeXl)
        .fontWeight(FontWeight.Bold)
      Span('.')
      Span(this.splitPrice(this.price).decimalPart)
        .fontSize(this.theme.fontSizeSm)
    }
      .fontColor(this.theme.primary)
  }

  @Builder
  renderOriginPrice() {
    if (this.originPrice) {
      Text() {
        Span('原价:')
        Span(this.currency)
        Span(this.originPrice.toFixed(2))
      }
        .fontSize(this.theme.fontSizeSm)
        .fontColor(this.theme.gray)
        .fontStyle(FontStyle.Italic)
        .decoration({
          type: TextDecorationType.LineThrough,
          color: this.theme.deepGray,
        })
    }
  }

  @Builder
  renderNum() {
    if (this.num !== 0) {
      Text('x' + this.num)
        .fontColor(Color.Gray)
        .fontSize(this.theme.fontSizeMd)
    }
  }

  @Builder
  renderTag() {
    Text(this.tag)
      .width('70lpx')
      .backgroundColor(this.theme.primary)
      .fontColor(this.theme.ghostWhite)
      .fontSize(this.theme.fontSizeSm)
      .padding('8lpx')
      .borderRadius({
        topRight: '50%',
        bottomRight: '50%',
      })
  }

  @Builder renderFooter() {}

  build() {
    Column({space: this.theme.spaceXs as string}) {
      Row({space: this.theme.spaceXs as string}) {
        // 缩略图
        Stack() {
          Column() {
            this.customThumb()
          }
          this.customTag()
        }
        .alignContent(Alignment.TopStart)

        // 标题、介绍、价格与数量等信息
        Column({space: this.theme.spaceXs as string}) {
          Column({space: this.theme.spaceXs as string}) {
            this.customTitle()
            this.customDesc()
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          Row({space: this.theme.spaceXs as string}) {
            this.customPrice()
            this.customOriginPrice()
            Blank()
            this.customNum()
          }
          .width('100%')
          .alignItems(VerticalAlign.Bottom)
        }
        .constraintSize({
          minHeight: '160lpx'
        })
        .layoutWeight(1)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width('100%')
      .alignItems(VerticalAlign.Top)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        this.customFooter()
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .margin({bottom: this.theme.spaceSm})
    .padding(this.theme.spaceXs)
    .backgroundColor(Color.White)
    // .borderWidth({
    //   bottom: 1
    // })
    // .borderColor('#eaeaea')
  }
}

export {
  WuCardProps
}
