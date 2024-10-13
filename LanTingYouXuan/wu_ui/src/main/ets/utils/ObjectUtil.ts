const ObjectUtil = {
  assign<T = object>(target: Partial<T>, ...sources: Partial<T>[]): T {
    return Object.assign(target, ...sources)
  }
}

export default ObjectUtil
