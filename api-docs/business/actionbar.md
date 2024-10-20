# ActionBar 商品动作栏

## 介绍

用于为页面相关操作提供便捷交互。

## 引入

```typescript
import { WuActionBar } from '@itrain/wu-ui'
```

## API

### @Props

| 名称      | 说明       | 类型   | 是否必需 | 默认值 |
| --------- | ---------- | ------ | -------- | ------ |
| cartBadge | 购物车徽标 | number | 否       | 0      |

### Events

| 名称           | 说明               | 回调函数   |
| -------------- | ------------------ | ---------- |
| onMessageClick | 点击消息图标       | () => void |
| onCartClick    | 点击购物车图标     | () => void |
| onAddToCart    | 点击加入购物车按钮 | () => void |
| onBuyNow       | 点击立即购买按钮   | () => void |

### @BuilderParam

| 名称          | 说明               |
| ------------- | ------------------ |
| customIcons   | 自定义左侧的图标组 |
| customButtons | 自定义右侧按钮组   |

