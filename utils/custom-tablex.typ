#import "@preview/t4t:0.3.2": is
#import "@preview/tablex:0.0.6": *

// 让 figure 的 kind 默认为 table，以支持 tablex 识别
#let fig(body, kind: auto, ..args) = figure(
  kind: if (kind != auto) {
    kind
  } else if (is.elem(image, body) or is.elem(raw, body)) {
    auto
  } else {
    // 让其默认为 table
    table
  },
  body,
  ..args,
)

// 三线表，包含居中，使用 tablex 实现
#let tlt(..args) = tablex(
  auto-lines: false,
  align: center + horizon,
  hlinex(y: 0),
  hlinex(y: 1),
  ..args,
  hlinex(),
)