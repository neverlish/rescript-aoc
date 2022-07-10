let input = Js.String.split("\n", Node.Fs.readFileAsUtf8Sync("input/aoc_2020_03.txt"))

let isTree = (step_x, step_y, line, i) => {
  if i == 0 {
    false
  } else if mod(i, step_y) > 0 {
    false
  } else {
    mod(i * step_x / step_y, Js.String.length(line))->Js.String.charAt(line) == "#"
  }
}

let traverse = (lines, step_x, step_y) => {
  lines->Belt.Array.keepWithIndex(isTree(step_x, step_y))->Belt.Array.size
}

// part1
traverse(input, 3, 1)->Js.log

// part2
[[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
->Belt.Array.map(([x, y]) => traverse(input, x, y))
->Belt.Array.reduce(1, (acc, v) => acc * v)
->Js.log // bigint 표시오류 수정
