# Search 搜索

## 介绍

用于搜索场景的输入框组件。

## 引入

```typescript
import { WuSearch } from '@itrain/wu-ui'
```

## API

### @Props

| 名称        | 说明                                                 | 类型          | 是否必需 | 默认值             |
| ----------- | ---------------------------------------------------- | ------------- | -------- | ------------------ |
| value       | 当前输入的值                                         | string        | 否       |                    |
| label       | 搜索框左侧文本                                       | ResourceStr   | 否       |                    |
| name        | 名称，作为提交表单时的标识符                         | string        | 否       |                    |
| placeholder | 占位提示文字                                         | ResourceStr   | 否       | '请输入搜索关键字' |
| bgColor     | 搜索框外部背景色                                     | ResourceColor | 否       |                    |
| shape       | 搜索框形状，<br>可选值为 `round` 与 `square`         | string        | 否       | 'square'           |
| clearable   | 是否启用清除图标，<br>点击清除图标后会清空输入框     | boolean       | 否       | false              |
| showAction  | 是否在搜索框右侧显示取消按钮                         | boolean       | 否       | false              |
| actionText  | 取消按钮文字                                         | ResourceStr   | 否       | '取消'             |
| disabled    | 是否禁用输入框                                       | boolean       | 否       | false              |
| isReadonly  | 是否将输入框设为只读状态，<br>只读状态下无法输入内容 | boolean       | 否       | false              |

### Events

| 名称     | 说明                 | 回调函数                                             |
| -------- | -------------------- | ---------------------------------------------------- |
| onChange | 输入框内容改变时触发 | (value: string, previewText?: PreviewText) => void   |
| onSearch | 确定搜索时触发       | (enterKey: EnterKeyType, event: SubmitEvent) => void |
| onClear  | 点击清除按钮后触发   | (event: ClickEvent, previousValue: string) => void   |
| onCancel | 点击取消按钮时触发   | () => void                                           |

### @BuilderParam

| 名称           | 说明                                                      |
| -------------- | --------------------------------------------------------- |
| customLeft     | 自定义左侧内容（搜索框外）                                |
| customLabel    | 自定义左侧文本（搜索框内）                                |
| customLeftIcon | 自定义左侧图标（搜索框内）                                |
| customAction   | 自定义右侧内容（搜索框外），设置 `show-action` 属性后展示 |

