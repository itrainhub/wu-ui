# Grid 宫格

## 介绍

宫格可以在水平方向上把页面分隔成等宽度的区块，用于展示内容或进行页面导航。

## 引入

```typescript
import { WuGrid } from '@itrain/wu-ui'
```

## API

### @Props

| 名称      | 说明           | 类型                                     | 是否必需 | 默认值  |
| --------- | -------------- | ---------------------------------------- | -------- | ------- |
| items     | 宫格数据       | [WuGridItem](#wu-grid-item)&#x05b;&#x5d; | 是       |         |
| columnNum | 列数           | number                                   | 否       | 4       |
| iconSize  | 图标大小       | Length                                   | 否       | '48lpx' |
| gutter    | 格子之间的间距 | Length                                   | 否       | 0       |
| bordered  | 是否显示边框   | boolean                                  | 否       | false   |

### Events

| 名称        | 说明             | 回调函数                   |
| ----------- | ---------------- | -------------------------- |
| onClickItem | 点击宫格项时触发 | (Item: WuGridItem) => void |

### 类型定义

组件导出以下类型定义:

```typescript
import type { WuGridItem } from '@itrain/wu-ui'
```

#### WuGridItem 数据格式

<div id="wu-grid-item"></div>

```typescript
export interface WuGridItem {
  key: string | number
  icon: ResourceStr
  text: ResourceStr
}
```

| 属性名 | 说明                                 |
| ------ | ------------------------------------ |
| key    | 用于宫格项列表渲染的key值绑定        |
| icon   | 宫格中的图标，支持本地与网络图片资源 |
| text   | 宫格项文本                           |

