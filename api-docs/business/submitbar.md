# SubmitBar 提交订单栏

## 介绍

用于展示订单金额与提交订单。

## 引入

```typescript
import { WuSubmitBar } from '@itrain/wu-ui'
```

## API

### @Props

| 名称       | 说明               | 类型    | 是否必需 | 默认值     |
| ---------- | ------------------ | ------- | -------- | ---------- |
| price      | 合计金额           | number  | 否       | 0          |
| checkAll   | 是否显示全选复选框 | boolean | 否       | true       |
| checked    | 选中状态           | boolean | 否       | false      |
| currency   | 货币符号           | string  | 否       | '￥'       |
| buttonText | 按钮文本           | string  | 否       | '提交订单' |
| tip        | 提示文本           | string  | 否       | &nbsp;     |

### Events

| 名称            | 说明               | 回调函数                   |
| --------------- | ------------------ | -------------------------- |
| onCheckedChange | 全选状态改变时触发 | (checked: boolean) => void |
| onSubmit        | 按钮点击事件回调   | () => void                 |

### @BuilderParam

| 名称           | 说明               |
| -------------- | ------------------ |
| customCheckAll | 自定义全选复选框   |
| customButton   | 自定义提交订单按钮 |
| customTip      | 自定义提示文案内容 |

