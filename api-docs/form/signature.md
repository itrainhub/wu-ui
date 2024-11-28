# Signature 签名

## 介绍

用于签名场景的组件，基于 Canvas 实现。

## 引入

```typescript
import { WuSignature } from '@itrain/wu-ui'
```

## 代码演示

### 基础用法

当点击确认按钮时，组件会触发 `onSubmit` 事件，事件的第一个参数为 `image`，意思如下：

- `image`：签名对应的图片，为 base64 字符串格式。若签名为空，则返回空字符串。

```typescript
WuSignature({
	onSubmit: image => {
    this.image = image
  },
  onClear: () => {
    promptAction.showToast({
      message: '清空了...',
    })
  }
})

Text('预览签名效果:')
  .width('100%')
Image(this.image)
  .width('100%')
  .height(200)
  .objectFit(ImageFit.Fill)
```

### 自定义笔触颜色

通过 `penColor` 来自定义笔触颜色。

```typescript
WuSignature({
  penColor: '#df1131',
  onSubmit: image => {
    this.image = image
  },
})
```

### 自定义线宽

通过 `lineWidth` 来自定义线条宽度。

```typescript
WuSignature({
  lineWidth: 10,
  onSubmit: image => {
    this.image = image
  },
})
```

### 自定义背景颜色

通过 `bgColor` 来自定义背景颜色。

```typescript
WuSignature({
  bgColor: '#cccccc',
  onSubmit: image => {
    this.image = image
  },
})
```

## API

### @Props

| 名称      | 说明               | 类型   | 是否必需 | 默认值    |
| --------- | ------------------ | ------ | -------- | --------- |
| penColor  | 笔触颜色，默认黑色 | string | 否       | '#000000' |
| lineWidth | 线条宽度           | number | 否       | 3         |
| bgColor   | 背景颜色           | string | 否       | &nbsp;    |

### Events

| 名称     | 说明               | 回调函数                |
| -------- | ------------------ | ----------------------- |
| onSubmit | 点击确定按钮后触发 | (image: string) => void |
| onClear  | 点击取消按钮后触发 | () => void              |
