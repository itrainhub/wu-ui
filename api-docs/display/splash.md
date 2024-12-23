# Splash 过渡页

## 介绍

过渡组件，通常用于应用启动时显示过渡页面效果，可以传递信息、故事或情感。

## 引入

```typescript
import { WuSplash } from '@itrain/wu-ui'
```

## API

### @Props

| 名称     | 说明   | 类型  | 是否必需 | 默认值 |
| -------- | -------------------------------------------------- | ------------------------- | -------- | -------- |
| duration | 过渡效果显示的延迟时间，<br>设置为0则不显示“跳过”按钮 | number                    | 否       | 5000     |
| image    | 过渡图片                                           | ResourceStr               | 否       |          |
| images   | 过渡图片组，设置该属性则以轮播<br>形式显示过渡图片效果 | ResourceStr &#x05b;&#x5d; | 否       | &nbsp; |

### Events

| 名称       | 说明                                               | 回调函数   |
| ---------- | -------------------------------------------------- | ---------- |
| onFinished | 过渡倒计时效果结束或点击“跳过”按钮后执行的回调函数 | () => void |

### @BuilderParam

| 名称               | 说明                                                         |
| ------------------ | ------------------------------------------------------------ |
| customLastCarousel | 当轮播显示最后一张过渡图片后显示的内容，在设置属性 `images` 后有效 |

