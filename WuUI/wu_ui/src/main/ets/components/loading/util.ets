/**
 * 转换为 vp 单位
 * @param size
 * @returns
 */
export function toVp(size: string | number): number {
  if (typeof size === 'number') {
    return size
  }

  if (size.endsWith('lpx')) {
    return px2vp(lpx2px(parseFloat(size)))
  }

  if (size.endsWith('px')) {
    return px2vp(parseFloat(size))
  }

  if (!isNaN(Number(size))) {
    return Number(size)
  }

  throw new Error('字符串长度单位应为lpx或px')
}

/**
 * 辅助函数：将 HEX 颜色转换为 RGB 格式
 * @param hex
 * @returns
 */
export function hexToRgb(hex: string): string {
  const bigint = parseInt(hex.slice(1), 16);
  const r = (bigint >> 16) & 255;
  const g = (bigint >> 8) & 255;
  const b = bigint & 255;
  return `${r}, ${g}, ${b}`;
}
