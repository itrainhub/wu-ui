# Wu-ui

## 介绍

Wu-ui 是一套简单易用的 `HarmonyOS NEXT` (纯血鸿蒙)开源 UI 组件库，本组件库基于 `HarmonyOS Next` 的 `API 12` 版本进行开发。

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
      // 此处添加初始化组件库代码
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

所有组件的使用方式详见[官方文档](https://wuui.gitbook.io/wuui)。

## 计划功能

- [x] 定制主题
- [x] Button 按钮
- [x] Cell 单元格
- [x] Icon 图标
- [x] Image 图片
- [ ] Layout 布局
- [x] Popup 弹出层
- [x] Toast 轻提示
- [ ] Calendar 日历
- [ ] Cascader 级联选择
- [x] Checkbox 复选框
- [ ] DatePicker 日期选择
- [x] Field 输入框
- [ ] Form 表单
- [ ] Radio 单选框
- [ ] Rate 评分
- [x] Search 搜索
- [ ] Signature 签名
- [x] Stepper 步进器
- [ ] Switch 开关
- [ ] TimePicker 时间选择器
- [ ] Uploader 文件上传
- [ ] ActionSheet 动作面板
- [ ] Barrage 弹幕
- [ ] Dialog 弹出框
- [x] Loading 加载
- [ ] Notify 消息通知
- [x] SwipeCell 滑动单元格
- [x] CountDown 倒计时
- [x] Divider 分割线
- [x] Empty 空状态
- [x] Splash 过渡页
- [ ] Steps 步骤条
- [ ] Watermark 水印
- [x] ActionBar 商品动作栏
- [x] BackTop 回到顶部
- [x] Grid 宫格
- [x] NavBar 导航栏
- [ ] Sidebar 侧边栏
- [ ] AddressEdit 地址编辑
- [ ] AddressList 地址列表
- [ ] Area 省市区选择
- [x] Card 商品卡片
- [ ] ContactCard 联系人卡片
- [ ] ContactEdit 联系人编辑
- [ ] ContactList 联系人列表
- [x] SubmitBar 提交订单栏

## 开源协议

本项目基于 MIT 开源协议，可自由地享受和参与开源。