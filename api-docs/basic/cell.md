# Cell 单元格

## 介绍

单元格为列表中的单个展示项。

## 引入

```typescript
import { WuCellGroup, WuCell } from '@itrain/wu-ui'
```

## 代码演示

### 基础用法

`Cell` 可以单独使用，也可以与 `CellGroup` 搭配使用，`CellGroup` 可以为 `Cell` 提供外边框。

```typescript
@Builder
_renderBasic() {
  WuCell({
    title: '单元格',
    value: '内容',
  })
  WuCell({
    title: '单元格',
    label: '描述信息',
    value: '内容',
    bordered: false,
  })
}

WuCellGroup({
  customContent: this._renderBasic,
})
```

### 卡片风格

通过 `CellGroup` 的 `inset` 属性，可以将单元格转换为圆角卡片风格。

```typescript
WuCellGroup({
  inset: true,
  customContent: this._renderBasic,
})
```

### 展示图标

通过 `icon` 属性在标题左侧展示图标。

```typescript
WuCell({
  title: '单元格',
  value: '内容',
  icon: 'location',
})
```

### 展示箭头

设置 `is-link` 属性后会在单元格右侧显示箭头。

```typescript
WuCell({
  title: '单元格',
  value: '内容',
  isLink: true,
})
```

### 分组标题

通过 `CellGroup` 的 `title` 属性可以指定分组标题。

```typescript
WuCellGroup({
  title: '分组1',
  customContent: this._renderBasic,
})
```

### 自定义布局

如以上用法不能满足你的需求，可以自定义布局内容。

```typescript
@Builder
__renderTitle() {
  Row() {
    Text('自定义标题')
      .fontSize('14fp')
    WuIcon({name: 'emoji', iconSize: 14})
  }
}
@Builder
__renderRightIcon() {
  WuIcon({name: 'search', color: Color.Gray})
}

WuCell({
  customTitle: this.__renderTitle,
  value: '内容',
})
WuCell({
  title: '单元格',
  customRightIcon: this.__renderRightIcon,
})
```

### 垂直居中

通过 `center` 属性可以让 `Cell` 的左右内容都垂直居中。

```typescript
WuCell({
  title: '单元格',
  label: '描述信息',
  value: '内容',
  center: true,
})
```

## API

### Cell @Props

| 名称      | 说明                           | 类型          | 是否必需 | 默认值      |
| --------- | ------------------------------ | ------------- | -------- | ----------- |
| title     | 左侧标题                       | ResourceStr   | 否       |             |
| value     | 右侧内容                       | ResourceStr   | 否       |             |
| label     | 标题下方的描述信息             | ResourceStr   | 否       |             |
| icon      | 左侧图标名称                   | string        | 否       |             |
| isLink    | 是否展示右侧箭头并开启点击反馈 | boolean       | 否       | false       |
| bgColor   | 背景颜色                       | ResourceColor | 否       | Color.White |
| clickable | 是否开启点击反馈               | boolean       | 否       | false       |
| bordered  | 是否显示内边框                 | boolean       | 否       | true        |
| center    | 是否使内容垂直居中             | boolean       | 否       | false       |

### CellGroup @Props

| 名称     | 说明                   | 类型          | 是否必需 | 默认值            |
| -------- | ---------------------- | ------------- | -------- | ----------------- |
| title    | 分组标题               | ResourceStr   | 否       |                   |
| inset    | 是否展示为圆角卡片风格 | boolean       | 否       | false             |
| bordered | 是否显示外边框         | boolean       | 否       | true              |
| bgColor  | 分组背景色             | ResourceColor | 否       | Color.Transparent |

### Cell @BuilderParam

| 名称            | 说明               |
| --------------- | ------------------ |
| customTitle     | 自定义标题         |
| customLabel     | 自定义描述信息     |
| customValue     | 自定义右侧内容     |
| customIcon      | 自定义标题前的图标 |
| customRightIcon | 自定义右侧图标     |

### CellGroup @BuilderParam

| 名称          | 说明             |
| ------------- | ---------------- |
| customTitle   | 自定义分组标题   |
| customContent | 自定义分组内容区 |

