# Stepper 步进器

## 介绍

步进器由增加按钮、减少按钮和输入框组成，用于在一定范围内输入、调整数字。

## 引入

```typescript
import { WuStepper } from '@itrain/wu-ui'
```

## API

### @Props

| 名称         | 说明                               | 类型    | 是否必需 | 默认值   |
| ------------ | ---------------------------------- | ------- | -------- | -------- |
| value        | 步进器数量值                       | number  | 是       |          |
| shape        | 风格，<br>可选 `round` 与 `square` | string  | 否       | 'square' |
| disableInput | 是否禁用输入框                     | boolean | 否       | False    |

### Events

| 名称     | 说明                     | 回调函数                |
| -------- | ------------------------ | ----------------------- |
| onChange | 当绑定值变化时触发的事件 | (value: number) => void |

