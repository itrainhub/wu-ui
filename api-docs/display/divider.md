# Divider 分割线

## 介绍

用于将内容分隔为多个区域。

## 引入

```typescript
import { WuDivider } from '@itrain/wu-ui'
```

## API

### @Props

| 名称         | 说明                                            | 类型        | 是否必需 | 默认值   |
| ------------ | ----------------------------------------------- | ----------- | -------- | -------- |
| dashed       | 是否使用虚线                                    | boolean     | 否       | false    |
| text         | 分割线上的文本                                  | ResourceStr | 否       |          |
| textPosition | 文本位置<br>可选取值有`left`、`center`、`right` | string      | 否       | 'center' |
| hairline     | 是否使用0.5px线                                 | boolean     | 否       | false    |

### @BuilderParam

| 名称       | 说明                         |
| ---------- | ---------------------------- |
| customText | 自定义分割线上的渲染文本内容 |

