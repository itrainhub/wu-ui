import { defaultStyles, WU_THEME_NAMESPACE } from '../../theme-chalk'
import { WuThemeStyleRecord } from '../../theme-chalk/types'
import { noop } from '../../utils/Common'
import { WuGridDataSource } from './types'

@Component
export struct WuGrid {
  @StorageProp(WU_THEME_NAMESPACE) theme: WuThemeStyleRecord = defaultStyles
  @Prop columnNum: number = 4 // 列数
  @Prop iconSize: Length = '48lpx' // 图标大小
  @Prop gutter: Length = 0 // 格子间距
  @Prop bordered: boolean = false // 是否显示边框
  @Prop items: WuGridDataSource[] // 宫格项数据

  onClickItem: (item: WuGridDataSource) => void = noop

  @BuilderParam customItem: (item: WuGridDataSource, index: number) => void = this.renderItem

  /**
   * 获取指定索引处宫格的边框设置
   * @param index
   * @returns
   */
  private getBorderWidth(index: number): Length | EdgeWidth {
    if (!this.bordered) {
      return 0
    }
    if (this.gutter !== 0) {
      return '2lpx'
    }

    const rows = Math.ceil(this.items.length / this.columnNum)
    const skip = (rows - 1) * this.columnNum

    return {
      top: '2lpx',
      left: '2lpx',
      right: (index + 1) % this.columnNum === 0 ? '2lpx' : 0,
      bottom: (index + 1) > skip ? '2lpx' : 0,
    }
  }

  @Builder
  renderItem(item: WuGridDataSource, index: number) {
    Column({space: this.theme.spaceSm as string}) {
      Image(item.icon)
        .width(this.iconSize)
        .aspectRatio(1)
      Text(item.text)
        .fontSize(this.theme.fontSizeSm)
    }
    .onClick(() => {
      this.onClickItem(item)
    })
  }

  build() {
    Grid() {
      ForEach(this.items, (item: WuGridDataSource, index: number) => {
        GridItem() {
          this.customItem(item, index)
        }
        .padding(this.theme.spaceSm)
        .borderWidth(this.getBorderWidth(index))
        .borderColor(this.theme.lightGray)
      }, (item: WuGridDataSource) => item.key.toString())
    }
    .maxCount(this.items.length)
    .columnsTemplate(Array(this.columnNum).fill('1fr').join(' '))
    .columnsGap(this.gutter)
    .rowsGap(this.gutter)
  }
}

export {
  WuGridDataSource
}
