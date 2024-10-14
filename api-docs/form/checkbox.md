# Checkbox 复选框

## 介绍

在一组备选项中进行多选。

## 引入

```typescript
import { WuCheckbox, WuCheckboxGroup } from '@itrain/wu-ui'
```

## API

### Checkbox @Props

| 名称         | 说明                               | 类型          | 是否必需 | 默认值  |
| ------------ | ---------------------------------- | ------------- | -------- | ------- |
| checked      | 是否为选中状态，<br>**非双向同步** | boolean       | 否       | false   |
| name         | 标识符，为一个唯一的字符串         | string        | 否       |         |
| label        | 标签文本                           | ResourceStr   | 否       |         |
| shape        | 形状，<br>可取 `round` 与 `square` | string        | 否       | 'round' |
| disabled     | 是否禁用复选框                     | boolean       | 否       | false   |
| checkedColor | 选中状态颜色                       | ResourceColor | 否       |         |
| group        | 分组名称                           | String        | 否       | &nbsp;  |

### CheckboxGroup @Props

| 名称  | 说明                             | 类型     | 是否必需 | 默认值 |
| ----- | -------------------------------- | -------- | -------- | ------ |
| group | 分组名称                         | string   | 是       |        |
| value | 所有选中项的标识符，**双向同步** | string[] | 否       | &nbsp; |

### Checkbox Events

| 名称     | 说明                     | 回调函数                 |
| -------- | ------------------------ | ------------------------ |
| onChange | 当选中值变化时触发的事件 | (value: boolean) => void |

### CheckboxGroup Events

| 名称     | 说明                           | 回调函数                                  |
| -------- | ------------------------------ | ----------------------------------------- |
| onChange | 当分组中选中值变化时触发的事件 | (value: string[]) => void                 |
| onLoad   | 加载完毕后执行                 | (context: WuCheckboxGroupContext) => void |

### CheckboxGroup 方法

通过 `onLoad()` 钩子获取到 `WuCheckoutGroupContext` 上下文对象，并调用上下文对象的方法:

| 方法名    | 说明                                                         | 参数                | 返回值 |
| :-------- | :----------------------------------------------------------- | :------------------ | :----- |
| toggleAll | 切换所有复选框，<br>传 `true` 为选中，`false` 为取消选中，<br>不传参为取反 | *checked?: boolean* | -      |

### 类型定义

#### WuCheckboxGroupContext

```typescript
export interface WuCheckboxGroupContext {
  toggleAll: (checked?: boolean) => void
}
```

复选框组上下文对象，提供 `toggleAll()` 方法实现切换全选、取消全选、反选的功能
