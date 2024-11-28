import { WuCell, WuCellGroup, WuIcon } from '@itrain/wu-ui'
import PageContainer from '../../components/PageContainer'

@Builder
export function renderCell() {
  CellDemo()
}

@Component
export struct CellDemo {
  @Builder
  _renderBasic() {
    WuCell({
      title: '单元格',
      value: '内容',
    })
    WuCell({
      title: '单元格',
      label: '描述信息',
      value: '内容',
      bordered: false,
    })
  }
  @Builder
  _renderIcon() {
    WuCell({
      title: '单元格',
      value: '内容',
      icon: 'location',
    })
  }
  @Builder
  _renderLink() {
    WuCell({
      title: '单元格',
      value: '内容',
      isLink: true,
    })
  }
  @Builder
  _renderGroup() {
    WuCellGroup({
      title: '分组1',
      customContent: this._renderBasic,
    })
    WuCellGroup({
      title: '分组2',
      customContent: this._renderBasic,
    })
  }
  @Builder
  __renderTitle() {
    Row() {
      Text('自定义标题')
        .fontSize('14fp')
      WuIcon({name: 'emoji', iconSize: 14})
    }
  }
  @Builder
  __renderRightIcon() {
    WuIcon({name: 'search', color: Color.Gray})
  }
  @Builder
  _renderCustom() {
    WuCell({
      customTitle: this.__renderTitle,
      value: '内容',
    })
    WuCell({
      title: '单元格',
      customRightIcon: this.__renderRightIcon,
    })
  }
  @Builder
  _renderCenter() {
    WuCell({
      title: '单元格',
      label: '描述信息',
      value: '内容',
      center: true,
    })
  }

  build() {
    PageContainer({
      title: 'Cell 单元格',
      defaultPadding: 0,
    }) {
      Column() {
        WuCellGroup({
          title: '基本用法',
          customContent: this._renderBasic,
        })

        WuCellGroup({
          title: '卡片风格',
          inset: true,
          customContent: this._renderBasic,
        })

        WuCellGroup({
          title: '展示图标',
          customContent: this._renderIcon,
        })

        WuCellGroup({
          title: '展示箭头',
          customContent: this._renderLink,
        })

        WuCellGroup({
          title: '分组标题',
          bordered: false,
          customContent: () => { this._renderGroup() },
        })

        WuCellGroup({
          title: '自定义布局',
          customContent: () => {
            this._renderCustom()
          },
        })

        WuCellGroup({
          title: '垂直居中',
          customContent: this._renderCenter,
        })
      }
      .width('100%')
    }
  }
}