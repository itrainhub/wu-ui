interface WuPricePart {
  integerPart: string
  decimalPart: string
}

/**
 * 将金额分割成整数与小数部分，可指定保留小数位数
 */
export const splitPrice = (price: number, digitLen: number = 2): WuPricePart => {
  const parts: string[] = price.toFixed(digitLen).split('.')
  return {
    integerPart: parts[0],
    decimalPart: parts[1],
  }
}