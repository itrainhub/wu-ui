export const noop = () => {}

export const nextTick = (callback: () => void, time = 300) => {
  setTimeout(() => {
    console.warn(`使用定时器延迟 ${time}ms 来模拟等待组件挂载或更新完毕`)
    callback()
  }, time)
}

export const format99 = (val: number) => {
  return val > 99 ? '99+' : val.toString()
}