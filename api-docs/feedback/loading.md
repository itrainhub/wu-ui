# Loading 加载

## 介绍

加载图标，用于表示加载中的过渡状态。

## 引入

```typescript
import { WuLoading } from '@itrain/wu-ui'
```

## API

### @Props

| 名称     | 说明                                     | 类型             | 是否必需 | 默认值     |
| -------- | ---------------------------------------- | ---------------- | -------- | ---------- |
| iconSize | 加载图标大小                             | string \| number | 否       | '48lpx'    |
| type     | 类型，<br>可选值为 `spinner`、`circular` | string           | 否       | 'circular' |
| color    | 颜色                                     | string           | 否       |            |
| text     | 加载方案                                 | ResourceStr      | 否       |            |
| vertical | 是否垂直排列图标与文字内容               | boolean          | 否       | false      |

### @BuilderParam

| 名称       | 说明                   |
| ---------- | ---------------------- |
| customText | 自定义加载文案文本内容 |
| customIcon | 自定义加载图标         |

