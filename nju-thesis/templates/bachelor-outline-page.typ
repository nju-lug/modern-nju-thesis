#import "@preview/outrageous:0.1.0"
#import "../utils/style.typ": 字号, 字体

#let bachelor-outline-page(
  depth: 3,
  title: "目　　录",
  title-vspace: 50pt,
  title-text-args: (font: 字体.宋体, size: 字号.三号, weight: "bold"),
  // 引用页数的字体，这里用于显示 Times New Roman
  reference-font: 字体.宋体,
  reference-size: 字号.小四,
  // 字体与字号
  font: (字体.黑体, 字体.宋体),
  size: (字号.四号, 字号.小四),
  // 垂直间距
  vspace: (25pt, 14pt),
  indent: (0pt, 18pt, 28pt),
  // 一级标题不显示点号
  fill: (none, auto),
  ..args,
) = {
  // 正式渲染
  pagebreak(weak: true)

  // 默认显示的字体
  set text(font: reference-font, size: reference-size)

  {
    set align(center)
    set text(..title-text-args)
    heading(level: 1, title)
  }

  v(title-vspace)

  show outline.entry: outrageous.show-entry.with(
    // 保留 Typst 基础样式
    ..outrageous.presets.typst,
    body-transform: (level, it) => {
      // 设置字体和字号
      set text(
        font: font.at(calc.min(level, font.len()) - 1),
        size: size.at(calc.min(level, size.len()) - 1),
      )
      // 计算缩进
      let indent-list = indent + range(level - indent.len()).map((it) => indent.last())
      let indent-length = indent-list.slice(0, count: level).sum()
      h(indent-length) + it
    },
    vspace: vspace,
    fill: fill,
    ..args,
  )

  // 显示目录
  outline(title: none, depth: depth)
}