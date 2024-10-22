# Empty 空状态

## 介绍

空状态时的占位提示。

## 引入

```typescript
import { WuEmpty } from '@itrain/wu-ui'
```

## API

### @Props

| 名称        | 说明               | 类型        | 是否必需 | 默认值   |
| ----------- | ------------------ | ----------- | -------- | -------- |
| image       | 图片               | ResourceStr | 否       |          |
| imageSize   | 图片大小           | Length      | 否       | '128lpx' |
| description | 图片下方的描述文字 | ResourceStr | 否       | &nbsp;   |

### @BuilderParam

| 名称              | 说明           |
| ----------------- | -------------- |
| customImage       | 自定义图片     |
| customDescription | 自定义描述文字 |
| customFooter      | 自定义底部内容 |

