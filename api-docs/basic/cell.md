# Cell 单元格

## 介绍

单元格为列表中的单个展示项。

## 引入

```typescript
import { WuCellGroup, WuCell } from '@itrain/wu-ui'
```

## API

### Cell @Props

| 名称      | 说明                           | 类型          | 是否必需 | 默认值      |
| --------- | ------------------------------ | ------------- | -------- | ----------- |
| title     | 左侧标题                       | ResourceStr   | 否       |             |
| value     | 右侧内容                       | ResourceStr   | 否       |             |
| label     | 标题下方的描述信息             | ResourceStr   | 否       |             |
| icon      | 左侧图标名称                   | string        | 否       |             |
| isLink    | 是否展示右侧箭头并开启点击反馈 | boolean       | 否       | false       |
| bgColor   | 背景颜色                       | ResourceColor | 否       | Color.White |
| clickable | 是否开启点击反馈               | boolean       | 否       | false       |
| bordered  | 是否显示内边框                 | boolean       | 否       | true        |

### CellGroup @Props

| 名称     | 说明                   | 类型          | 是否必需 | 默认值            |
| -------- | ---------------------- | ------------- | -------- | ----------------- |
| title    | 分组标题               | ResourceStr   | 否       |                   |
| inset    | 是否展示为圆角卡片风格 | boolean       | 否       | false             |
| bordered | 是否显示外边框         | boolean       | 否       | true              |
| bgColor  | 分组背景色             | ResourceColor | 否       | Color.Transparent |

### Cell @BuilderParam

| 名称            | 说明               |
| --------------- | ------------------ |
| customTitle     | 自定义标题         |
| customLabel     | 自定义描述信息     |
| customValue     | 自定义右侧内容     |
| customIcon      | 自定义标题前的图标 |
| customRightIcon | 自定义右侧图标     |

### CellGroup @BuilderParam

| 名称          | 说明             |
| ------------- | ---------------- |
| customTitle   | 自定义分组标题   |
| customContent | 自定义分组内容区 |

