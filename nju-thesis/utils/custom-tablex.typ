#import "@preview/t4t:0.3.2": is
#import "@preview/tablex:0.0.6": *

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

#let tlt(..args) = tablex(
  auto-vlines: false,
  align: center + horizon,
  ..args,
)