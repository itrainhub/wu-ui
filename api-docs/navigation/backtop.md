# BackTop 回到顶部

## 介绍

返回页面顶部的操作按钮，该组件应该配合 `Stack` 层叠布局一起使用。

## 引入

```typescript
import { WuBackTop } from '@itrain/wu-ui'
```

## API

### @Props

| 名称      | 说明               | 类型      | 是否必需 | 默认值 |
| --------- | ------------------ | --------- | -------- | ------ |
| visible   | 是否显示组件       | boolean   | 否       | false  |
| right     | 距离页面右侧的距离 | Dimension | 否       | 20     |
| bottom    | 距离页面底部的距离 | Dimension | 否       | 20     |
| zIndexNum | 设置组件z序层级    | number    | 否       | 999    |
| scroller  | 滚动控制器对象     | Scroller  | 否       | &nbsp; |

