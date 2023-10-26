#import "utils/style.typ": 字号, 字体

#let conf(
  fallback: false,
  margin: (x: 92pt),
  leading: 1.25em,
  spacing: 1.25em,
  justify: true,
  it,
) = {
  set text(fallback: fallback)
  set page(margin: margin)
  set text(font: 字体.宋体, size: 字号.小四)
  set par(leading: leading, justify: justify)
  show par: set block(spacing: spacing)

  it
}