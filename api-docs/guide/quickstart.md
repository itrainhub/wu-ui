# 快速上手

通过本章节，你可以了解到 wu-ui 的安装方法和基本使用方式。

## 下载安装

```bash
$ ohpm install @itrain/wu-ui
```

## 使用方法

### 初始化组件库

在 `EntryAbility.ets` 文件中添加:

```typescript
// ......
import WuUI from '@itrain/wu-ui'

export default class EntryAbility extends UIAbility {
  // ......

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // ......
    
    windowStage.loadContent('pages/Splash', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      
      /***********************************/
      /****** 此处添加初始化组件库代码 *******/
      /***********************************/
      WuUI.init(windowStage)
      
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }
  
  // ......
}
```

### 使用组件

示例:

```typescript
import WuUI, { WuSplash } from '@itrain/wu-ui'
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

  build() {
    Column() {
      // 渲染过渡页
      WuSplash({
        duration: 5000,
        images: [$r('app.media.splash'), $r('app.media.splash2'), $r('app.media.splash3')],
        onFinished() {
          router.replaceUrl({
            url: 'pages/Main'
          })
        }
      })
    }
  }
}
```

