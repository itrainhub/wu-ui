# Button 按钮

## 介绍

按钮用于触发一个操作，如提交表单。

## 引入

```typescript
import { WuButton } from '@itrain/wu-ui'
```

## API

### @Props

| 名称     | 说明                                                         | 类型        | 是否必需 | 默认值    |
| -------- | ------------------------------------------------------------ | ----------- | -------- | --------- |
| type     | 类型，<br>可选值为 `primary`、`success`、<br>`warning`、`danger`、`default` | string      | 否       | 'default' |
| text     | 按钮文字                                                     | ResourceStr | 否       | '按钮'    |
| shape    | 按钮形状，<br/>可选值为 `round` 与 `square`                  | string      | 否       | 'square'  |
| btnSize  | 尺寸，<br>可选值为 `large`、`small`、`mini`、`normal`        | string      | 否       | 'normal'  |
| plain    | 是否为朴素按钮                                               | boolean     | 否       | false     |
| disabled | 是否禁用按钮                                                 | boolean     | 否       | false     |

