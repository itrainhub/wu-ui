import { WuButton, WuCheckbox, WuCheckboxGroup, WuCheckboxGroupContext } from '@itrain/wu-ui'

@Builder
export function renderCheckbox() {
  CheckboxDemo()
}

@Component
export struct CheckboxDemo {

  @State hobbies: string[] = ['swimming']
  ctx?: WuCheckboxGroupContext

  build() {
    NavDestination() {
      Column() {
        Text('复选框组测试')

        Text('分组选中项:' + JSON.stringify(this.hobbies))

        // Row() {
        //   Row() {
        //     Checkbox()
        //     Text('hello')
        //   }
        //
        //   Row() {
        //     Checkbox()
        //     Text('hello')
        //   }
        //
        //   Row() {
        //     Checkbox()
        //     Text('hello')
        //   }
        // }
        // .width('100%')

        WuCheckboxGroup({
          group: 'hobbies',
          value: this.hobbies,
          onLoad: (context) => {
            this.ctx = context
          },
          onChange: (val: string[]) => {
            console.log('所有选中:' + JSON.stringify(val))
          },
        })

        Row() {
          WuCheckbox({
            group: 'hobbies',
            name: 'game',
            label: '玩游戏',
          })
          WuCheckbox({
            group: 'hobbies',
            name: 'study',
            label: '学习',
          })
          WuCheckbox({
            group: 'hobbies',
            name: 'swimming',
            label: '游泳',
          })
          WuCheckbox({
            group: 'hobbies',
            name: 'sleep',
            label: '睡觉',
          })
        }

        Row() {
          WuButton({
            text: '全选'
          })
            .onClick(() => {
              this.ctx?.toggleAll(true)
            })
          WuButton({
            text: '取消'
          })
            .onClick(() => {
              this.ctx?.toggleAll(false)
            })
          WuButton({
            text: '反选'
          })
            .onClick(() => {
              this.ctx?.toggleAll()
            })
        }
      }
      .height('100%')
      .width('100%')
    }
    .title('Checkbox 复选框')
  }
}