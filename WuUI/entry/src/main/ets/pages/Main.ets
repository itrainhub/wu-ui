import { WuCell, WuCellGroup } from '@itrain/wu-ui'
import { ContainerModifier } from '../styles/Page'

interface IDemoComponent {
  path: string
  name: string
  label: string
}

interface IDemoItem {
  title: string
  desc: string
  components: IDemoComponent[]
}

@Entry
@Component
struct Main {
  // 所有示例
  @State allDemos: IDemoItem[] = [
    {
      title: 'basic',
      desc: '基础组件',
      components: [
        {
          path: 'button',
          name: 'Button',
          label: '按钮',
        },
        {
          path: 'cell',
          name: 'Cell',
          label: '单元格',
        },
        {
          path: 'icon',
          name: 'Icon',
          label: '图标',
        },
        {
          path: 'image',
          name: 'Image',
          label: '图片',
        },
        {
          path: 'popup',
          name: 'Popup',
          label: '弹出层',
        },
        {
          path: 'toast',
          name: 'Toast',
          label: '轻提示',
        }
      ],
    },
    {
      title: 'form',
      desc: '表单组件',
      components: [
        {
          path: 'checkbox',
          name: 'Checkbox',
          label: '复选框',
        },
        {
          path: 'field',
          name: 'Field',
          label: '输入框',
        },
        {
          path: 'search',
          name: 'Search',
          label: '搜索',
        },
        {
          path: 'stepper',
          name: 'Stepper',
          label: '步进器',
        },
      ]
    },
    {
      title: 'navigation',
      desc: '导航组件',
      components: [
        {
          path: 'backtop',
          name: 'BackTop',
          label: '回到顶部',
        },
        {
          path: 'grid',
          name: 'Grid',
          label: '宫格',
        },
        {
          path: 'navbar',
          name: 'NavBar',
          label: '导航栏',
        },
      ],
    },
    {
      title: 'display',
      desc: '展示组件',
      components: [
        {
          path: 'countdown',
          name: 'CountDown',
          label: '倒计时',
        },
        {
          path: 'divider',
          name: 'Divider',
          label: '分割线',
        },
        {
          path: 'empty',
          name: 'Empty',
          label: '空状态',
        },
        {
          path: 'splash',
          name: 'Splash',
          label: '过渡页',
        },
        {
          path: 'tag',
          name: 'Tag',
          label: '标签',
        },
      ],
    },
    {
      title: 'feedback',
      desc: '反馈组件',
      components: [
        {
          path: 'loading',
          name: 'Loading',
          label: '加载',
        },
        {
          path: 'swipecell',
          name: 'SwipeCell',
          label: '滑动单元格',
        },
      ],
    },
    {
      title: 'business',
      desc: '业务组件',
      components: [
        {
          path: 'actionbar',
          name: 'ActionBar',
          label: '商品动作栏',
        },
        {
          path: 'card',
          name: 'Card',
          label: '商品卡片',
        },
        {
          path: 'submitbar',
          name: 'SubmitBar',
          label: '提交订单栏',
        },
      ],
    },
  ]

  private navPathStack: NavPathStack = new NavPathStack()

  @Builder
  _renderGroups(demo: IDemoItem) {
    ForEach(demo.components, (component: IDemoComponent) => {
      WuCell({
        title: component.name,
        value: component.label,
        isLink: true,
      })
        .onClick(() => {
          console.log('要跳转咯...', JSON.stringify(this.navPathStack))
          this.navPathStack.pushPathByName(component.path, null)
        })
    }, (comp: IDemoComponent) => comp.path)
  }

  build() {
    Navigation(this.navPathStack) {
      List() {
        ForEach(this.allDemos, (demo: IDemoItem) => {
          ListItem() {
            WuCellGroup({
              title: demo.desc,
              inset: true,
              customContent: () => { this._renderGroups(demo) }
            })
          }
        }, (demo: IDemoItem) => demo.title)
      }
      .width('100%')
      .height('100%')
    }
    .title('WuUI 组件库')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .attributeModifier(new ContainerModifier<NavigationAttribute>())
  }
}