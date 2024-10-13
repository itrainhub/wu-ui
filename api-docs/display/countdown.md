# CountDown 倒计时

## 介绍

用于实时展示倒计时数值，支持毫秒精度。

## 引入

```typescript
import { WuCountDown } from '@itrain/wu-ui'
```

## API

### @Props

| 名称        | 说明                                             | 类型                                               | 是否必需 | 默认值        |
| ----------- | ------------------------------------------------ | -------------------------------------------------- | -------- | ------------- |
| time        | 倒计时时长，单位毫秒                             | number                                             | 是       |               |
| autoStart   | 是否自动开始倒计时                               | boolean                                            | 否       | true          |
| format      | 时间格式                                         | string                                             | 否       | 'DD:HH:mm:ss' |
| millisecond | 是否开启毫秒级渲染                               | boolean                                            | 否       | false         |
| controller  | 倒计时控制器，<br>可用于手动控制开始、暂停与重置 | [WuCountDownController](#wu-count-down-controller) | 否       | &nbsp;        |

### format 格式

| 格式 | 说明         |
| :--- | :----------- |
| DD   | 天数         |
| HH   | 小时         |
| mm   | 分钟         |
| ss   | 秒数         |
| S    | 毫秒（1 位） |
| SS   | 毫秒（2 位） |
| SSS  | 毫秒（3 位） |

### Events

| 名称         | 说明                                                         | 回调函数                                                     |
| ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| onTimeUpdate | 倒计时变化时触发，<br>当自定义倒计时内容时，<br>可利用该回调获取倒计时时间 | (countDownTime: [WuCountDownTime](#wu-count-down-time)) => void |
| onFinish     | 倒计时结束时触发                                             | () => void                                                   |

### @BuilderParam

| 名称          | 说明                 |
| ------------- | -------------------- |
| customContent | 自定义倒计时显示内容 |

### 类型定义

组件导出以下类型定义:

```typescript
import type { WuCountDownController, WuCountDownTime } from '@itrain/wu-ui'
```

#### WuCountDownController 数据格式

<div id="wu-count-down-controller"></div>

```typescript
export class WuCountDownController {
  start: () => void
  pause: () => void
  reset: () => void
  // ......
}
```

| 属性名 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| start  | 开始倒计时                                                   |
| pause  | 暂停倒计时                                                   |
| reset  | 重设倒计时，若 `autoStart` 为 `true`，重设后会自动开始倒计时 |

#### WuCountDownTime 数据格式

<div id="wu-count-down-time"></div>

```typescript
export interface WuCountDownTime {
  total: number
  days: number
  hours: number
  minutes: number
  seconds: number
  milliseconds: number
}
```

| 名称         | 说明                   |
| :----------- | :--------------------- |
| total        | 剩余总时间（单位毫秒） |
| days         | 剩余天数               |
| hours        | 剩余小时               |
| minutes      | 剩余分钟               |
| seconds      | 剩余秒数               |
| milliseconds | 剩余毫秒               |
