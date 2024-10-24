export interface WuCountDownTime {
  total: number
  days: number
  hours: number
  minutes: number
  seconds: number
  milliseconds: number
}

/**
 * 数字不足2位前补0
 * @param num
 * @returns
 */
function pad(num: number, len: number = 2) {
  return num.toString().padStart(len, '0')
}

/**
 * 将毫秒值转换为天时分秒
 */
export function mill2dhms(totalMilliseconds: number): WuCountDownTime {
  const milliseconds = totalMilliseconds % 1000
  const seconds = Math.floor(totalMilliseconds / 1000) % 60
  const minutes = Math.floor(totalMilliseconds / (1000 * 60)) % 60
  const hours = Math.floor(totalMilliseconds / (1000 * 60 * 60)) % 24
  const days = Math.floor(totalMilliseconds / (1000 * 60 * 60 * 24))

  console.log('trans:' + totalMilliseconds, days, hours, minutes, seconds)

  return {
    total: totalMilliseconds,
    days,
    hours,
    minutes,
    seconds,
    milliseconds,
  }
}

/**
 * 将日期时间按照指定格式进行格式化
 * @param datetime
 * @param format
 * @returns
 */
export function formatDatetime(datetime: WuCountDownTime, format: string = 'DD:HH:mm:ss') {
  const milliseconds = pad(datetime.milliseconds, 3)
  const map: Record<string, string> = {
    DD: pad(datetime.days),
    HH: pad(datetime.hours),
    mm: pad(datetime.minutes),
    ss: pad(datetime.seconds),
    S: milliseconds.slice(0, 1),  // 最高一位毫秒
    SS: milliseconds.slice(0, 2), // 最高两位毫秒
    SSS: milliseconds             // 全部毫秒
  }

  return format.replace(/DD|HH|mm|ss|S{1,3}/g, matched => map[matched])
}