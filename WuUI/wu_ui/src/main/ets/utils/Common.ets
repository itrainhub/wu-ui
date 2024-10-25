/**
 * 空函数
 */
export const noop = () => {}

/**
 * 模拟nextTick
 */
export const nextTick = (callback: () => void, time = 300) => {
  setTimeout(() => {
    console.warn(`使用定时器延迟 ${time}ms 来模拟等待组件挂载或更新完毕`)
    callback()
  }, time)
}

/**
 * 数字格式化，超过 99 的数字返回 '99+'
 */
export const format99 = (val: number) => {
  return val > 99 ? '99+' : val.toString()
}

/**
 * 给函数的执行加上动画
 * @param fn：要在动画内执行的回调函数，通常fn里面会改变状态变量
 * @param duration：动画持续时长
 * @param curve：动画区线
 */
export function runWithAnimation(fn: Function, duration: number = 400, curve: Curve = Curve.Smooth): void {
  animateTo({ duration, curve }, () => {
    fn()
  })
}

/**
 * 判断是否合法的URL地址
 * @param name
 * @returns
 */
export function isValidUrl(name: string) {
  // 通过正则表达式检查是否为有效的 URL
  const urlPattern = /^(https?:)?\/\//
  return urlPattern.test(name)
}
