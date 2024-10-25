import { WuButton } from "@itrain/wu-ui"
import { ContainerModifier } from "../../styles/Page"
import { TitleFontModifier } from "../../styles/Text"

@Builder
export function renderButton() {
  ButtonDemo()
}

@Component
export struct ButtonDemo {
  @State titleModifier: TitleFontModifier = new TitleFontModifier()

  /**
   * 渲染按钮类型
   */
  @Builder
  _renderTypes() {
    Column({space: 16}) {
      Text('按钮类型')
        .attributeModifier(this.titleModifier)

      Row({space: 8}) {
        WuButton({
          type: 'primary',
          text: '主要按钮',
        })
        WuButton({
          type: 'success',
          text: '成功按钮',
        })
        WuButton({
          type: 'default',
          text: '默认按钮',
        })
      }
      .width('100%')
      Row({space: 8}) {
        WuButton({
          type: 'danger',
          text: '危险按钮',
        })
        WuButton({
          type: 'warning',
          text: '警告按钮',
        })
      }
      .width('100%')
    }
    .width('100%')
  }

  /**
   * 渲染朴素按钮
   */
  @Builder
  _renderPlain() {
    Column({space: 16}) {
      Text('朴素按钮')
        .attributeModifier(this.titleModifier)

      Row({space: 8}) {
        WuButton({
          type: 'primary',
          plain: true,
          text: '朴素按钮',
        })
        WuButton({
          type: 'success',
          plain: true,
          text: '朴素按钮',
        })
        WuButton({
          type: 'danger',
          plain: true,
          text: '朴素按钮',
        })
      }
      .width('100%')
    }
    .width('100%')
  }

  /**
   * 渲染禁用状态按钮
   */
  @Builder
  _renderDisabled() {
    Column({space: 16}) {
      Text('禁用状态')
        .attributeModifier(this.titleModifier)

      Row({space: 8}) {
        WuButton({
          type: 'primary',
          text: '禁用状态',
          disabled: true,
        })
        WuButton({
          type: 'success',
          text: '禁用状态',
          disabled: true,
        })
        WuButton({
          type: 'danger',
          text: '禁用状态',
          disabled: true,
        })
      }
      .width('100%')
    }
    .width('100%')
  }

  /**
   * 渲染按钮形状
   */
  @Builder
  _renderShape() {
    Column({space: 16}) {
      Text('按钮形状')
        .attributeModifier(this.titleModifier)

      Row({space: 8}) {
        WuButton({
          type: 'primary',
          text: '方形按钮',
          shape: 'square',
        })
        WuButton({
          type: 'success',
          text: '圆形按钮',
          shape: 'round',
        })
      }
      .width('100%')
    }
    .width('100%')
  }

  /**
   * 渲染按钮尺寸
   */
  @Builder
  _renderSize() {
    Column({space: 16}) {
      Text('按钮尺寸')
        .attributeModifier(this.titleModifier)

      Row({space: 8}) {
        WuButton({
          type: 'primary',
          text: '超大号按钮',
          btnSize: 'huge',
        })
        WuButton({
          type: 'primary',
          text: '大号按钮',
          btnSize: 'large',
        })
      }
      .width('100%')
      Row({space: 8}) {
        WuButton({
          type: 'primary',
          text: '普通按钮',
          btnSize: 'normal',
        })
        WuButton({
          type: 'primary',
          text: '小号按钮',
          btnSize: 'small',
        })

        WuButton({
          type: 'primary',
          text: '迷你按钮',
          btnSize: 'mini',
        })
      }
      .width('100%')
    }
    .width('100%')
  }

  /**
   * 渲染块级按钮
   */
  @Builder
  _renderBlock() {
    Column({space: 16}) {
      Text('块级按钮')
        .attributeModifier(this.titleModifier)

      Row({space: 8}) {
        WuButton({
          type: 'primary',
          text: '超大号块级按钮',
          btnSize: 'huge',
          block: true,
        })
      }
      .width('100%')
    }
    .width('100%')
  }

  build() {
    NavDestination() {
      Scroll() {
        Column({ space: 24 }) {
          // 按钮类型
          this._renderTypes()
          // 朴素按钮
          this._renderPlain()
          // 禁用状态
          this._renderDisabled()
          // 按钮形状
          this._renderShape()
          // 按钮尺寸
          this._renderSize()
          // 块级按钮
          this._renderBlock()
        }
        .width('100%')
      }
      .attributeModifier(new ContainerModifier<ScrollAttribute>(true))
    }
    .title('Button 按钮')
  }
}