function findOriginalArray (changed: number[]): number[] {
  if ((changed.length % 2) === 1) {
    return []
  }

  const queue: number[] = []
  const result: number[] = []
  changed.sort((a, b) => a - b)

  let head = 0
  for (const i of changed) {
    if (queue[head] === i) {
      head += 1
    } else {
      result.push(i)
      queue.push(i * 2)
    }
  }

  return queue.length === head ? result : []
}