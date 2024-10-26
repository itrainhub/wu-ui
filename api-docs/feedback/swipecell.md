# SwipeCell 滑动单元格

## 介绍

可以左右滑动来展示操作按钮的单元格组件。

## 引入

```typescript
import { WuSwipeCell } from '@itrain/wu-ui'
```

## 代码演示

### 基本用法

`SwipeCell` 组件提供了左右两个区域，用于定义两侧滑动区域的内容。

```typescript
WuSwipeCell({
  customLeft: this.renderBasicLeft,
  customContent: this.renderBasicContent,
  customRight: this.renderBasicRight,
})

@Builder
renderBasicContent() {
  WuCell({
    title: '单元格',
    value: '内容',
    bordered: false,
  })
}

@Builder
renderBasicLeft() {
  Button('选择')
    .type(ButtonType.Normal)
    .height('100%')
}

@Builder
renderBasicRight() {
  Row() {
    Button('删除')
      .type(ButtonType.Normal)
      .backgroundColor(Color.Red)
      .height('100%')
    Button('收藏')
      .type(ButtonType.Normal)
      .height('100%')
  }
}
```

### 自定义内容

`SwipeCell` 可以嵌套任意内容，比如嵌套一个商品卡片。

```typescript
WuSwipeCell({
  customContent: this.renderCustomContent,
  customRight: this.renderCustomRight,
})

@Builder
renderCustomContent() {
  WuCard({
    thumb: $r('app.media.banner1'),
    title: '这是商品标题',
    price: 9.9,
    num: 18,
    tag: 'hot'
  })
}
@Builder
renderCustomRight() {
  Button('删除')
    .type(ButtonType.Normal)
    .backgroundColor(Color.Red)
    .height('100%')
}
```

## API

### @BuilderParam

| 名称          | 说明                     |
| ------------- | ------------------------ |
| customLeft    | 自定义左侧滑动区域的内容 |
| customContent | 自定义显示的内容         |
| customRight   | 自定义右侧滑动区域的内容 |

