# Card 商品卡片

## 介绍

商品卡片，用于展示商品的图片、价格等信息。

## 引入

```typescript
import { WuCard } from '@itrain/wu-ui'
```

## API

### @Props

| 名称        | 说明                             | 类型        | 是否必需 | 默认值 |
| ----------- | -------------------------------- | ----------- | -------- | ------ |
| title       | 标题                             | string      | 否       |        |
| desc        | 描述                             | string      | 否       |        |
| thumb       | 左侧图片                         | ResourceStr | 否       |        |
| thumbLink   | 点击左侧图片后<br>跳转的链接地址 | string      | 否       |        |
| price       | 商品价格                         | number      | 否       | 0      |
| originPrice | 商品划线原价                     | number      | 否       | 0      |
| num         | 商品数量                         | number      | 否       | 0      |
| currency    | 货币符号                         | string      | 否       | '¥'    |
| tag         | 图片角标                         | string      | 否       | &nbsp; |

### Events

| 名称         | 说明                 | 回调函数   |
| ------------ | -------------------- | ---------- |
| onClickThumb | 点击自定义图片时触发 | () => void |

### @BuilderParam

| 名称              | 说明             |
| ----------------- | ---------------- |
| customTitle       | 自定义标题       |
| customDesc        | 自定义描述       |
| customThumb       | 自定义左侧图片   |
| customPrice       | 自定义价格       |
| customOriginPrice | 自定义划线原价   |
| customNum         | 自定义商品数量   |
| customTag         | 自定义图片角标   |
| customFooter      | 自定义右下角内容 |

