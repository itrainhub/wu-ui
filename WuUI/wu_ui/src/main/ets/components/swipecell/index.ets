import { util } from "@kit.ArkTS"
import { componentUtils, matrix4 } from "@kit.ArkUI"
import { noop, runWithAnimation } from "../../utils/Common"

class WuSwipeCellController {
  close: () => void = noop
}

@Component
export struct WuSwipeCell {
  controller: WuSwipeCellController = new WuSwipeCellController()

  private leftId: string = 'left_' + util.generateRandomUUID()
  private rightId: string = 'right_' + util.generateRandomUUID()
  private centerId: string = 'center_' + util.generateRandomUUID()
  private leftWidth: number = 0
  private rightWidth: number = 0
  @State rowHeight: Length = 'auto'
  @State matrix: matrix4.Matrix4Transit = matrix4.identity().copy()

  private rate: number = 0.2
  private offsetX: number = 0
  private positionX: number = 0
  private l2r: boolean = true // 是否从左向右滑动

  @BuilderParam customLeft: () => void
  @BuilderParam customRight: () => void
  @BuilderParam customContent: () => void

  aboutToAppear(): void {
    if (this.controller) {
      this.controller.close = () => {
        this.offsetX = 0
        this.positionX = -this.leftWidth
        runWithAnimation(() => {
          this.matrix = matrix4.identity().translate({x: this.positionX}).copy()
        })
      }
    }
  }

  /**
   * 处理拖动过程
   */
  handleActionUpdate() {
    if (this.offsetX < -1 * (this.leftWidth + this.rightWidth)) {
      this.offsetX = -1 * (this.leftWidth + this.rightWidth)
    } else if (this.offsetX > 0) {
      this.offsetX = 0
    }
    this.matrix = matrix4.identity().translate({
      x: this.offsetX,
      y: 0,
    }).copy()
  }

  /**
   * 重置偏移并运动
   */
  rePosition() {
    // 暂存上一次移动后的位置
    this.positionX = this.offsetX
    // 判断 positionX 落在哪个区间范围
    if (this.positionX < -1 * this.leftWidth - (this.l2r ? (1 - this.rate) : this.rate) * this.rightWidth) {
      this.positionX = -1 * (this.leftWidth + this.rightWidth)
    } else if (this.positionX < -1 * (this.l2r ? (1 - this.rate) : this.rate) * this.leftWidth) {
      this.positionX = -1 * this.leftWidth
    } else {
      this.positionX = 0
    }

    runWithAnimation(() => {
      this.matrix = matrix4.identity().translate({
        x: this.positionX,
        y: 0,
      }).copy()
    })
  }

  build() {
    Row() {
      Row() {
        // 左侧区域
        Column() {
          this.customLeft?.()
        }
        .id(this.leftId)
        // 主体区域
        Column() {
          this.customContent?.()
        }
        .width('100%')
        .id(this.centerId)
        .onClick(() => {
          this.controller.close()
        })
        // 右侧区域
        Column() {
          this.customRight?.()
        }
        .id(this.rightId)
      }
      .transform(this.matrix)
      .height(this.rowHeight)
    }
    .width('100%')
    .clip(true)
    .onAppear(() => {
      // 左中右组件
      const _l = componentUtils.getRectangleById(this.leftId)
      const _r = componentUtils.getRectangleById(this.rightId)
      const _c = componentUtils.getRectangleById(this.centerId)
      // 左右两侧组件宽度
      this.leftWidth = _l.size.width
      this.rightWidth = _r.size.width
      // 布局高度
      this.rowHeight = px2vp(_c.size.height)
      // 初始化显示主体内容区
      this.matrix = matrix4.identity().translate({
        x: -1 * this.leftWidth,
        y: 0,
      }).copy()
      this.positionX = -1 * this.leftWidth
    })
    .gesture(
      GestureGroup(
        GestureMode.Exclusive,
        // 向右拖动
        PanGesture({fingers: 1, direction: PanDirection.Right})
          .onActionUpdate((event: GestureEvent) => {
            this.offsetX = this.positionX + vp2px(event.offsetX)
            this.handleActionUpdate()
          })
          .onActionEnd(() => {
            this.l2r = true
            this.rePosition()
          }),
        // 向左拖动
        PanGesture({fingers: 1, direction: PanDirection.Left})
          .onActionUpdate((event: GestureEvent) => {
            // 向左拖动时的平移位置
            this.offsetX = this.positionX + vp2px(event.offsetX)
            this.handleActionUpdate()
          })
          .onActionEnd(() => {
            this.l2r = false
            this.rePosition()
          }),
      )
    )
  }
}
