import {
  WuBackTop,
  WuButton, WuCountDown, WuCountDownController,
  WuCountDownTime,
  WuDivider,
  WuField,
  WuGrid,
  WuGridDataSource,
  WuIcon, WuSearch,
  WuStepper } from '@itrain/wu-ui'
import { IBanner } from '../models/Banner'

@Entry
@Component
struct Index {
  @State banners: IBanner[] = [
    { id: 1, title: '第一张', image: $r('app.media.banner1') },
    { id: 2, title: '第二张', image: $r('app.media.banner2') },
    { id: 3, title: '第三张', image: $r('app.media.banner3') },
    { id: 4, title: '第四张', image: $r('app.media.banner4') },
    { id: 5, title: '第五张', image: $r('app.media.banner5') },
    { id: 6, title: '第六张', image: $r('app.media.banner6') },
  ]
  @State grids: WuGridDataSource[] = [
    { key: 1, icon: $r('app.media.item_1'), text: '优选超市' },
    { key: 2, icon: $r('app.media.item_2'), text: '服饰美妆' },
    { key: 3, icon: $r('app.media.item_3'), text: '数码3C' },
    { key: 4, icon: $r('app.media.item_4'), text: '充值中心' },
    { key: 5, icon: $r('app.media.item_5'), text: '兰庭会员' },
    { key: 6, icon: $r('app.media.item_6'), text: '兰庭生鲜' },
    { key: 7, icon: $r('app.media.item_7'), text: '优选国际' },
    { key: 8, icon: $r('app.media.item_8'), text: '兰庭优品' },
    { key: 9, icon: $r('app.media.item_9'), text: '天天拍卖' },
    { key: 10, icon: $r('app.media.item_10'), text: '全部专题' },
  ]
  controller: WuCountDownController = new WuCountDownController()

  @State scrollY: number = 0
  scroller: Scroller = new Scroller()

  @Builder
  _renderSearchLeft() {
    WuIcon({ name: 'scan', fontSize: 24, color: Color.White })
  }

  @Builder
  _renderSearchRight() {
    // WuButton({
    //   text: '登录',
    //   type: 'primary',
    // })
    Text('登录')
      .fontSize(14)
      .fontColor(Color.White)
  }

  @Builder
  renderSearchBar() {
    WuSearch({
      value: '嘻嘻哈哈',
      shape: 'square',
      bgColor: '#d43309',
      // clearable: true,
      isReadonly: true,
      showAction: true,
      customLeft: this._renderSearchLeft,
      customAction: this._renderSearchRight,
      // actionText: '登录',
      // onClear: () => {
      //   console.log('清空了...')
      // },
      // onCancel: () => {
      //   console.log('登录了......')
      // }
    })
  }

  @Builder
  _renderGridItem(item: WuGridDataSource, index: number) {
    Row() {
      Image(item.icon)
        .width('48lpx')
        .aspectRatio(1)
      Text(item.text)
        .fontSize(12)
    }
  }

  @Builder
  _renderDividerText() {
    Text('这是在说笑吧')
  }

  @State remainTime: WuCountDownTime | undefined = undefined

  @Builder
  _renderCountDownText() {
    Text(this.remainTime?.total + '')
  }

  @State inputValue: string = ''

  @Builder
  _renderUserButton() {
    WuButton({
      text: '发送',
      type: 'primary',
    })
  }

  build() {
    Stack() {
      Scroll(this.scroller) {


        Column({space: 8}) {
          Divider().strokeWidth(1).color(Color.Red)


          Button(){
            Text('测试一下')
              .fontSize('10fp')
              // .lineHeight('64lpx')
          }
            .padding({ left: '8lpx', right: '8lpx' })
            .height('32lpx')

          Button(){
            Text('测试一下')
              .fontSize('12fp')
            // .lineHeight('64lpx')
          }
          .padding({ left: '8lpx', right: '8lpx' })
          .height('40lpx')

          Button(){
            Text('测试一下')
              .fontSize('14fp')
            // .lineHeight('64lpx')
          }
          .padding({ left: '8lpx', right: '8lpx' })
          .height('48lpx')

          Row() {
            Button(){
              Text('测试一下')
                .fontSize('16fp')
              // .lineHeight('64lpx')
            }
            .padding({ left: '8lpx', right: '8lpx' })
            .height('64lpx')
            .type(ButtonType
              .Normal)
            .borderRadius('8lpx')
            Button(){
              Text('测试一下')
                .fontSize('16fp')
              // .lineHeight('64lpx')
            }
            .padding({ left: '8lpx', right: '8lpx' })
            .height('64lpx')
            .type(ButtonType
              .Normal)
            .borderRadius('16lpx')
            Button(){
              Text('测试一下')
                .fontSize('16fp')
              // .lineHeight('64lpx')
            }
            .padding({ left: '8lpx', right: '8lpx' })
            .height('64lpx')
            .type(ButtonType
              .Normal)
            .borderRadius('24lpx')
            Button(){
              Text('测试一下')
                .fontSize('16fp')
              // .lineHeight('64lpx')
            }
            .padding({ left: '8lpx', right: '8lpx' })
            .height('64lpx')
            .type(ButtonType
              .Normal)
            .borderRadius('32lpx')

            Button('测试一下')
          }




          // 搜索栏
          this.renderSearchBar()
          // 轮播图
          Swiper() {
            ForEach(this.banners, (banner: IBanner) => {
              Image(banner.image)
                .width('100%')
                .height(150)
                .objectFit(ImageFit.Fill)
            })
          }

          // 宫格
          Column() {
            WuGrid({
              columnNum: 5,
              items: this.grids,
              // bordered: true,
              // gutter: 4,
              // customItem: this._renderGridItem,
            })
          }
          .padding(12)

          // 分割线
          WuDivider({
            text: '猜你喜欢',
            // textPosition: 'right',
            dashed: true,
            hairline: true,
            customText: this._renderDividerText,
          })

          Text('倒计时:')
          WuCountDown({
            // time: 363 * 24 * 60 * 60 * 1000,
            // time: 18 * 60 * 60 * 1000,
            time: 60 * 1000,
            format: 'HH时mm分ss秒SS-DD天',
            autoStart: false,
            controller: this.controller,
            // millisecond: true,
            customContent: () => {
              this._renderCountDownText()
            },
            onTimeUpdate: (time: WuCountDownTime) => {
              console.log('time update...')
              this.remainTime = time
            },
            onFinish: () => {
              console.log('计时完毕...............')
            }
          })
          Button('开始').onClick((event: ClickEvent) => {
            this.controller.start()
          })
          Button('暂停').onClick((event: ClickEvent) => {
            this.controller.pause()
          })
          Button('重置').onClick((event: ClickEvent) => {
            this.controller.reset()
          })

          WuStepper({
            value: 15
          })

          WuField({
            label: '用户名',
            value: this.inputValue,
            labelWidth: 50,
            labelAlign: TextAlign.End,
            inputBordered: false,
            clearable: true,
            rules: [
              {required: true, message: '用户名必填', trigger: 'blur'},
              {pattern: /^[a-z]\w{5,9}$/, message: '用户名以小写字母开头, 长度在6-10之间'}
            ],
            customButton: this._renderUserButton
            // required: true,
            // errMessage: '用户名必填!'
          })
            .backgroundColor(Color.Gray)
          WuField({
            label: '密码',
            value: this.inputValue,
            labelWidth: 50,
            labelAlign: TextAlign.End,
            type: InputType.Password,
            clearable: true,
            rules: [
              { required: true, message: '密码必填!!!' }
            ]
            // required: true,
          })
        }
        .width('100%')
        .height(3000)
      }
      .height('100%')
      .width('100%')
      .onDidScroll((x, y) => {
        this.scrollY += y
      })

      WuBackTop({
        visible: this.scrollY > 400,
        scroller: this.scroller,
        bottom: 80,
      })

      // if (this.scrollY > 700) {
      //   WuBackTop({
      //     visible: true,
      //   })
      // }
    }
    .height('100%')
    .width('100%')
  }
}