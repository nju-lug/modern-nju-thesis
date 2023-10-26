#import "utils/style.typ": 字号, 字体

#let conf(
  fallback: false,
  it,
) = {
  set text(fallback: fallback)
  set page(margin: (x: 92pt))
  set text(font: 字体.宋体, size: 字号.小四)
  set par(leading: 3em, justify: true)
  show par: set block(spacing: 2em)
  it
}