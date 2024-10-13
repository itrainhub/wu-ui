# Field 输入框

## 介绍

用户可以在文本框内输入或编辑文字。

## 引入

```typescript
import { WuField } from '@itrain/wu-ui'
```

## API

### @Props

| 名称          | 说明                   | 类型          | 是否必需 | 默认值           |
| ------------- | ---------------------- | ------------- | -------- | ---------------- |
| value         | 输入框绑定值           | string        | 是       |                  |
| name          | 名称                   | string        | 否       |                  |
| label         | 标签                   | string        | 否       |                  |
| labelWidth    | 标签宽度               | Length        | 否       | 'auto'           |
| labelAlign    | 标签对齐方式           | TextAlign     | 否       | TextAlign.Start  |
| placeholder   | 输入框占位提示文字     | string        | 否       | '请输入文本'     |
| type          | 输入框类型             | InputType     | 否       | InputType.Normal |
| bgColor       | 背景颜色               | ResourceColor | 否       |                  |
| textArea      | 是否显示文本域         | boolean       | 否       | false            |
| required      | 是否必需               | boolean       | 否       | false            |
| errMessage    | 错误消息               | ResourceStr   | 否       |                  |
| clearable     | 是否允许清空           | boolean       | 否       | false            |
| inputBordered | 输入区域是否显示边框线 | boolean       | 否       | true             |
| rules         | 校验规则               | WuFormRule[]  | 否       | []               |

### Events

| 名称 | 说明 | 回调函数 |
| ---- | ---- | -------- |
|      |      |          |

## @BuilderParam

| 名称         | 说明           |
| ------------ | -------------- |
| customButton | 自定义右侧按钮 |

