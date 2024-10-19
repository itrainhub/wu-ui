# 定制主题

组件库提供了主题定制能力，在需要自定义主题时，通过调用 `WuUI.setThemeStyles()` 方法，设置主题。

## 自定义主题

在 EntryAbility 或是项目启动页中，调用 `WuUI.setThemeStyles()` 方法修改主题变量来自定义主题。如在启动页中:

```typescript
import WuUI from '@itrain/wu-ui'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Splash {
  aboutToAppear(): void {
    // 自定义主题
    WuUI.setThemeStyles({
      primary: '#d81e06',
    })
  }

	// ......
}
```

## 主题变量

目前组件库支持修改的主题变量如下:

| 变量名          | 说明           | 类型   | 默认值                                                       |
| --------------- | -------------- | ------ | ------------------------------------------------------------ |
| primary         | 主要颜色       | string | <button style="background-color: #1989fa; color: #ffffff; border-radius: 4px; border-width: 0;">#1989fa</button> |
| success         | 成功颜色       | string | <button style="background-color: #07c160; color: #ffffff; border-radius: 4px; border-width: 0;">#07c160</button> |
| danger          | 危险(错误)颜色 | string | <button style="background-color: #ee0a24; color: #ffffff; border-radius: 4px; border-width: 0;">#ee0a24</button> |
| warning         | 警告颜色       | string | <button style="background-color: #ff976a; color: #ffffff; border-radius: 4px; border-width: 0;">#ff976a</button> |
| default         | 默认颜色       | string | <button style="background-color: #ffffff; color: #000000; border-radius: 4px; border-width: 1px;">#ffffff</button> |
| lightGray       | 浅灰色         | string | <button style="background-color: #dbdbdb; color: #ffffff; border-radius: 4px; border-width: 0;">#dbdbdb</button> |
| gray            | 灰色           | string | <button style="background-color: #8a8a8a; color: #ffffff; border-radius: 4px; border-width: 0;">#8a8a8a</button> |
| deepGray        | 深灰色         | string | <button style="background-color: #515151; color: #ffffff; border-radius: 4px; border-width: 0;">#515151</button> |
| ghostWhite      | 幽灵白         | string | <button style="background-color: #fafafa; color: #000000; border-radius: 4px; border-width: 0;">#fafafa</button> |
| fontSizeXs      | 正文超小字号   | string | 10fp                                                         |
| fontSizeSm      | 正文小字号     | string | 12fp                                                         |
| fontSizeMd      | 正文中等字号   | string | 14fp                                                         |
| fontSizeLg      | 正文大字号     | string | 16fp                                                         |
| fontSizeXl      | 正文超大字号   | string | 18fp                                                         |
| fontSizeTitleXs | 标题超小字号   | string | 18fp                                                         |
| fontSizeTitleSm | 标题小字号     | string | 20fp                                                         |
| fontSizeTitleMd | 标题中等字号   | string | 24fp                                                         |
| fontSizeTitleLg | 标题大字号     | string | 30fp                                                         |
| heightXs        | 超小高度值     | string | 32lpx                                                        |
| heightSm        | 小高度值       | string | 40lpx                                                        |
| heightMd        | 中等高度值     | string | 48lpx                                                        |
| heightLg        | 大高度值       | string | 64lpx                                                        |
| borderRadiusXs  | 超小圆角       | string | 8lpx                                                         |
| borderRadiusSm  | 小圆角         | string | 16lpx                                                        |
| borderRadiusMd  | 中等圆角       | string | 24lpx                                                        |
| borderRadiusLg  | 大圆角         | string | 32lpx                                                        |
| spaceXs         | 超小间距       | string | 8lpx                                                         |
| spaceSm         | 小间距         | string | 16lpx                                                        |
| spaceMd         | 中等间距       | string | 24lpx                                                        |
| spaceLg         | 大间距         | string | 32lpx                                                        |
| spaceXl         | 超大间距       | string | 48lpx                                                        |

