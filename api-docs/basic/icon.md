# Icon 图标

## 介绍

基于字体的图标集，可以通过 Icon 组件使用。

## 引入

```typescript
import { WuIcon } from '@itrain/wu-ui'
```

## 所有图标

<iframe id="icon-iframe" src="./wu-ui-font/index.html" frameborder="no" border="0" scrolling="no" style="width: 100%;"></iframe>
<script type="text/javascript">
  const iconFrame = document.getElementById('icon-iframe')
  iconFrame.onload = () => {
    var dHeight = iconFrame.contentWindow.document.documentElement.scrollHeight
    iconFrame.height = dHeight
    document.querySelector('.book-body .body-inner').onscroll = function(event) {
      iconFrame.contentWindow.document.querySelector('.toast_box').style.top = event.target.scrollTop + 'px'
    }
  }
</script>
## API

### @Props

| 名称     | 说明     | 类型                  | 是否必需 | 默认值      |
| -------- | -------- | --------------------- | -------- | ----------- |
| name     | 图标名称 | string                | 是       |          |
| fontSize | 字体大小 | ResourceStr &#x7c; number | 否       | 16        |
| color    | 字体颜色 | ResourceColor         | 否       | Color.Black |

