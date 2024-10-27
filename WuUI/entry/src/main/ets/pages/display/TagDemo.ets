import { WuCell, WuCellGroup, WuTag } from "@itrain/wu-ui"
import { WuShape, WuThemeType } from "@itrain/wu-ui/src/main/ets/theme-chalk/types"
import { ContainerModifier } from "../../styles/Page"

@Builder
export function renderTag() {
  TagDemo()
}

interface WuTagProps {
  type: WuThemeType
  text: ResourceStr
  tagSize: 'small' | 'normal' | 'large'
  color: string
  show: boolean
  plain: boolean
  shape: WuShape
  mark: boolean
  textColor: string
  closeable: boolean
  hairline: boolean
  onClose: () => void
  bordered: boolean
}

@Component
export struct TagDemo {

  @Builder
  __renderType(options: Partial<WuTagProps> = {}) {
    WuTag({
      type: options.type,
      plain: options.plain,
      text: options.text ?? '标签',
      tagSize: options.tagSize,
      color: options.color,
      show: options.show,
      shape: options.shape,
      mark: options.mark,
      textColor: options.textColor,
      closeable: options.closeable,
      hairline: options.hairline,
      bordered: options.bordered,
      onClose: options.onClose,
    })
  }

  @Builder
  _renderBasic() {
    ForEach(['primary', 'success', 'danger', 'warning', 'default'], (type: WuThemeType) => {
      WuCell({
        title: type + ' 类型',
        customValue: () => { this.__renderType({ type }) }
      })
    }, (item: string) => item)
  }

  @Builder
  _renderStyle() {
    WuCell({
      title: '空心样式',
      customValue: () => { this.__renderType({ type: 'primary', plain: true }) }
    })

    WuCell({
      title: '圆角样式',
      customValue: () => { this.__renderType({ type: 'primary', shape: 'round' }) }
    })

    WuCell({
      title: '标记样式',
      customValue: () => { this.__renderType({ type: 'primary', mark: true }) }
    })

    WuCell({
      title: '可关闭标签',
      customValue: () => { this.__renderType({ type: 'primary', closeable: true, onClose: () => { console.log('关闭了') } }) }
    })
  }

  @Builder
  _renderSize() {
    WuCell({
      title: '小号标签',
      customValue: () => { this.__renderType({ type: 'primary', tagSize: 'small' }) },
    })
    WuCell({
      title: '中号标签',
      customValue: () => { this.__renderType({ type: 'primary', tagSize: 'normal' }) },
    })
    WuCell({
      title: '大号标签',
      customValue: () => { this.__renderType({ type: 'primary', tagSize: 'large' }) },
    })
  }

  @Builder
  _renderColor() {
    WuCell({
      title: '背景颜色',
      customValue: () => { this.__renderType({ type: 'primary', color: '#7232dd' }) },
    })

    WuCell({
      title: '文字颜色',
      customValue: () => { this.__renderType({ type: 'primary', textColor: '#ad0000' }) },
    })

    WuCell({
      title: '空心颜色',
      customValue: () => { this.__renderType({ type: 'primary', color: '#7232dd', plain: true }) },
    })
  }

  @Builder
  _renderBorder() {
    WuCell({
      title: '取消边框',
      customValue: () => { this.__renderType({ type: 'primary', plain: true, bordered: false, }) },
    })
    WuCell({
      title: '正常边框',
      customValue: () => { this.__renderType({ type: 'primary', textColor: '#7232dd', plain: true, }) },
    })
    WuCell({
      title: '细边框',
      customValue: () => { this.__renderType({ type: 'primary', textColor: '#7232dd', hairline: true, plain: true, }) },
    })
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          WuCellGroup({
            title: '基本用法',
            inset: true,
            customContent: () => { this._renderBasic() },
          })

          WuCellGroup({
            title: '样式风格',
            inset: true,
            customContent: () => { this._renderStyle() },
          })

          WuCellGroup({
            title: '标签大小',
            inset: true,
            customContent: () => { this._renderSize() },
          })

          WuCellGroup({
            title: '自定义颜色',
            inset: true,
            customContent: () => { this._renderColor() },
          })

          WuCellGroup({
            title: '边框线宽',
            inset: true,
            customContent: () => { this._renderBorder() },
          })
        }
        .width('100%')
      }
      .attributeModifier(new ContainerModifier<ScrollAttribute>())
    }
    .title('Tag 标签')
  }
}