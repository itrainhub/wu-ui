import { WuButton, WuCard, WuCheckbox, WuStepper } from '@itrain/wu-ui'

@Builder
export function renderCard() {
  CardDemo()
}

interface ICardGoods {
  id: number
  title: string
  image: ResourceStr
  price: number
  amount: number
  checked: boolean
}

@Component
export struct CardDemo {
  @State goods: ICardGoods[] = [
    {id: 1, title: '红龙（REDRAGON）M61 SE 有线磁轴机械键盘 8K回报率 RT键盘 可调节键程 RGB背光 61键电竞游戏键盘-黑色', image: $r('app.media.banner1'), price: 11.11, amount: 1, checked: false},
    {id: 2, title: '商品标题2', image: $r('app.media.banner2'), price: 22.22, amount: 2, checked: false},
    {id: 3, title: '商品标题3', image: $r('app.media.banner3'), price: 33.33, amount: 3, checked: false},
    {id: 4, title: '商品标题4', image: $r('app.media.banner4'), price: 44.44, amount: 4, checked: false},
    {id: 5, title: '商品标题5', image: $r('app.media.banner5'), price: 55.55, amount: 5, checked: false},
    {id: 6, title: '商品标题6', image: $r('app.media.banner6'), price: 66.66, amount: 6, checked: false},
  ]

  @Builder
  _renderTitle(title: string) {
    Text(title)
      .maxLines(1)
  }
  @Builder
  _renderNum(num: number) {
    WuStepper({
      value: num,
      shape: 'round',
    })
  }
  @Builder
  _renderThumb(thumb: ResourceStr, checked: boolean) {
    Row() {
      WuCheckbox({
        checked,
      })
      Image(thumb)
        .width('150lpx')
        .aspectRatio(1)
        .objectFit(ImageFit.Fill)
    }
    .width('200lpx')
    .clip(true)
  }

  @Builder
  _renderFooter() {
    Row() {
      WuButton({
        text: '删除',
        btnSize: 'mini',
        type: 'primary'
      })
    }
    .width('100%')
    .justifyContent(FlexAlign.End)
  }

  build() {
    NavDestination() {
      Column() {

        ForEach(this.goods, (goods: ICardGoods) => {
          WuCard({
            // title: 'abcdefg',
            desc: goods.title,
            price: goods.price,
            originPrice: goods.price,
            thumb: goods.image,
            // num: goods.amount,
            tag: '标签',
            customTitle: () => {
              this._renderTitle(goods.title)
            },
            customNum: () => {
              this._renderNum(goods.amount)
            },
            // customThumb: () => {this._renderThumb(goods.image, goods.checked)},
            customFooter: () => {
              this._renderFooter()
            },
            onClickThumb: () => {
              console.log('点击了图片')
            }
          })
        })
      }
      .height('100%')
      .width('100%')
    }
    .title('Card 商品卡片')
  }
}