# Popup 弹出层

## 介绍

弹出层组件，用于展示弹窗、信息提示等内容。

## 引入

```typescript
import { WuPopup } from '@itrain/wu-ui'
```

## API

### @Props

| 名称                | 说明                                                         | 类型    | 是否必需 | 默认值   |
| ------------------- | ------------------------------------------------------------ | ------- | -------- | -------- |
| visible             | 是否显示弹出层<br>双向同步                                   | boolean | 是       |          |
| placement           | 弹出位置，<br>可选值为 `top` `bottom` `right` `left` `center` | string  | 否       | 'center' |
| round               | 是否显示圆角                                                 | boolean | 否       | true     |
| popupWidth          | 弹窗宽度                                                     | Length  | 否       |          |
| popupHeight         | 弹窗高度                                                     | Length  | 否       |          |
| safeAreaInsetTop    | 是否开启顶部安全区适配                                       | boolean | 否       | false    |
| safeAreaInsetBottom | 是否开启底部安全区适配                                       | boolean | 否       | false    |
| duration            | 动画时长，单位毫秒                                           | number  | 否       | 400      |
| maskable            | 是否显示遮罩层                                               | boolean | 否       | true     |
| maskClosable        | 是否允许点击遮罩关闭弹窗                                     | boolean | 否       | true     |
| closeable           | 是否显示关闭图标                                             | boolean | 否       | false    |

### Events

| 名称    | 说明                 | 回调函数   |
| ------- | -------------------- | ---------- |
| onOpen  | 弹窗打开时执行的回调 | () => void |
| onClose | 弹窗关闭时执行的回调 | () => void |

### @BuilderParam

| 名称          | 说明           |
| ------------- | -------------- |
| customContent | 自定义弹窗内容 |

