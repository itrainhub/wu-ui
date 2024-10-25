# Toast 轻提示

## 介绍

在页面中间弹出黑色半透明提示，用于消息通知、加载提示、操作结果提示等场景。

目前提供的是**辅助函数调用方式**的轻提示功能，暂不支持使用 Toast 组件。

## 引入

```typescript
import { WuToast } from '@itrain/wu-ui'
```

## 代码演示

### 文字提示

```typescript
WuToast.showToast('文字提示')
```

### 加载提示

```typescript
WuToast.showLoadingToast('加载提示')
```

### 成功/失败提示

使用 `showSuccessToast` 方法展示成功提示，使用 `showFailToast` 方法展示失败提示。

```typescript
WuToast.showSuccessToast('成功提示')
WuToast.showFailToast('失败提示')
```

### 自定义图标

通过 `icon` 选项可以自定义图标，支持传入图标名称或图片链接。

```typescript
WuToast.showToast({
  message: '自定义图标',
  icon: 'appreciate', // 图标名称
})

WuToast.showToast({
  message: '自定义图片',
  icon: 'https://developer.huawei.com/allianceCmsResource/resource/HUAWEI_Developer_VUE/images/0417/home-new-12.png',
})
```

通过 `loadingType` 属性可以自定义加载图标类型。

```typescript
WuToast.showToast({
  message: '自定义加载图标',
  type: 'loading',
  loadingType: 'spinner',
})
```

### 自定义位置

Toast 默认渲染在屏幕正中位置，通过 `placement` 属性可以控制 Toast 展示的位置。

```typescript
WuToast.showToast({
  message: '顶部展示',
  placement: 'top',
})

WuToast.showToast({
  message: '顶部展示',
  placement: 'bottom',
})
```

### 文字换行方式

通过 `wordBreak` 选项可以控制 Toast 中的文字过长时的截断方式。

```typescript
// 换行时截断单词
WuToast.showToast({
  message: 'This message will contain a incomprehensibilities long word.',
  placement: 'bottom',
  wordBreak: WordBreak.BREAK_ALL,
})

// 换行时不截断单词
WuToast.showToast({
  message: 'This message will contain a incomprehensibilities long word.',
  placement: 'bottom',
  wordBreak: WordBreak.BREAK_WORD,
})
```

### 遮罩

默认轻提示不显示遮罩效果，可配置 `overlay` 显示遮罩。

```typescript
WuToast.showToast({
  message: '显示遮罩',
  overlay: true,
})
```

显示遮罩后默认可点击遮罩关闭轻提示，也可通过 `forbidClick` 禁止点击遮罩关闭。

```typescript
WuToast.showToast({
  message: '禁止点击遮罩',
  type: 'fail',
  overlay: true,
  forbidClick: true,
})
```

### 展示时长控制

可通过 `duration` 属性控制提示展示时长，如果设置为0则需要手动关闭。

```typescript
WuToast.showToast({
  message: '5秒自动关闭',
  type: 'success',
  duration: 5000,
})
```

手动关闭时调用 `closeToast()` 方法完成。

```typescript
WuToast.showToast({
  message: '手动关闭',
  type: 'loading',
  duration: 0,
  onOpen: () => {
    // 模拟3秒手动关闭
    setTimeout(() => {
      WuToast.closeToast()
    }, 3000)
  }
})
```

## API

### 方法

Toast 相关的辅助函数:

| 方法名             | 说明         | 参数          | 返回值 |
| ------------------ | ------------ | ------------- | ------ |
| showToast()        | 展示文字提示 | WuToastOption | void   |
| showLoadingToast() | 展示加载提示 | WuToastOption | void   |
| showSuccessToast() | 展示成功提示 | WuToastOption | void   |
| showFailToast()    | 展示失败提示 | WuToastOption | void   |
| closeToast()       | 关闭提示     | WuToastOption | void   |

### WuToastOption 数据结构

调用 `showToast` 等方法时，支持传入以下选项：

| 参数        | 说明                                                 | 类型      | 默认值           |
| :---------- | :--------------------------------------------------- | :-------- | :--------------- |
| message     | 文本内容                                             | string    |                  |
| type        | 提示类型，可选值为 `loading` `success` `fail` `text` | string    | `text`           |
| icon        | 自定义图标，支持传入图标名称或图片链接               | string    |                  |
| iconSize    | 图标大小                                             | Length    | '128lpx'         |
| placement   | 位置，可选值为 `top` `bottom` `center`               | string    | 'center'         |
| overlay     | 是否显示背景遮罩层                                   | boolean   | false            |
| duration    | 展示时长(ms)，值为 0 时，toast 不会消失              | number    | 2000             |
| loadingType | 加载图标odga，可选值为 `spinner`、`circular`         | string    | 'circular'       |
| wordBreak   | 文本内容的换行方式                                   | WordBreak | WordBreak.NORMAL |
| forbidClick | 是否禁止背景点击                                     | boolean   | false            |
| onOpen      | 展示后的回调函数                                     | Function  |                  |
| onClose     | 关闭后的回调函数                                     | Function  | &nbsp;           |
