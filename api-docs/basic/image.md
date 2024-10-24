# Image 图片

## 介绍

增强版的图片组件，支持图片加载中提示、加载失败提示、点击图片预览等。

## 引入

```typescript
import { WuImage } from '@itrain/wu-ui'
```

## API

### @Props

| 名称                   | 说明                                                 | 类型          | 是否必需 | 默认值           |
| ---------------------- | ---------------------------------------------------- | ------------- | -------- | ---------------- |
| src                    | 图片资源或地址，<br>支持本地 Resource 和图片网络地址 | ResourceStr   | 是       |                  |
| alt                    | 图片加载时显示的占位图                               | ResourceStr   | 否       |                  |
| fit                    | 填充模式                                             | ImageFit      | 否       | ImageFit.Contain |
| imgWidth               | 图片宽度                                             | Length        | 否       | '640lpx'         |
| imgHeight              | 图片高度                                             | Length        | 否       | '480lpx'         |
| radius                 | 圆角大小                                             | Length        | 否       | '16lpx'          |
| shape                  | 形状，支持 `square` 和 `round`                       | string        | 否       | 'square'         |
| showError              | 是否显示加载错误提示                                 | boolean       | 否       | true             |
| errorIcon              | 加载出错时的图标                                     | ResourceStr   | 否       | 默认图片         |
| preview                | 是否允许预览图片                                     | boolean       | 否       | false            |
| previewImage           | 预览大图资源或地址                                   | ResourceStr   | 否       |                  |
| previewBackgroundColor | 预览图片背景                                         | ResourceColor | 否       | Color.Black      |
| showLoading            | 是否显示加载提示                                     | boolean       | 否       | true             |

### Events

| 名称    | 说明               | 回调函数   |
| ------- | ------------------ | ---------- |
| onLoad  | 图片加载完毕时触发 | () => void |
| onError | 图片加载出错时触发 | () => void |

### @BuilderParam

| 名称          | 说明               |
| ------------- | ------------------ |
| customLoading | 自定义加载提示信息 |
| customError   | 自定义错误提示信息 |

