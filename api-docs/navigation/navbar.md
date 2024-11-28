# NavBar 导航栏

## 介绍

为页面提供导航功能，常用于页面顶部。

## 引入

```typescript
import { WuNavBar } from '@itrain/wu-ui'
```

## 代码演示

### 基本用法

通过 `title` 属性设置导航栏标题。

```typescript
WuNavBar({
  title: '标题',
})
```

### 返回上级

在导航栏实现返回上级功能。

```typescript
WuNavBar({
  title: '标题',
  leftText: '返回',
  leftArrow: true,
  onLeftClick: () => { console.log('返回上一页') }
})
```

### 右侧按钮

在导航栏右侧添加可点击的按钮。

```typescript
WuNavBar({
  title: '标题',
  leftText: '返回',
  leftArrow: true,
  rightText: '按钮',
  onRightClick: () => {
    promptAction.showToast({ message: '点击了右侧按钮', })
  },
})
```

### 自定义两侧按钮

可自定义导航栏两侧的内容。

```typescript
@Builder
_customLeft() {
  Row({space: 4}) {
    WuIcon({
      name: 'home',
    })
    Text('主页')
      .fontSize(16)
  }
}

@Builder
_customRight() {
  WuIcon({
    name: 'search',
  })
}

WuNavBar({
  title: '标题',
  customLeft: this._customLeft,
  customRight: this._customRight,
})
```

## API

### @Props

| 名称      | 说明                 | 类型        | 是否必需 | 默认值 |
| --------- | -------------------- | ----------- | -------- | ------ |
| title     | 标题                 | ResourceStr | 否       |        |
| back      | 是否显示左侧按钮     | boolean     | 否       | true   |
| leftText  | 左侧按钮文案         | ResourceStr | 否       |        |
| leftArrow | 是否显示左侧按钮箭头 | boolean     | 否       | false  |
| rightText | 右侧文案             | ResourceStr | 否       | &nbsp; |

### Events

| 名称         | 说明               | 回调函数   |
| ------------ | ------------------ | ---------- |
| onLeftClick  | 点击左侧按钮时触发 | () => void |
| onRightClick | 点击右侧按钮时触发 | () => void |

### @BuilderParam

| 名称        | 说明           |
| ----------- | -------------- |
| customTitle | 自定义标题     |
| customLeft  | 自定义左侧按钮 |
| customRight | 自定义右侧按钮 |
