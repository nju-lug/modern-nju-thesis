#import "@preview/anti-matter:0.0.2": anti-front-end
#import "../utils/style.typ": 字号, 字体
#import "../utils/custom-numbering.typ": custom-numbering
#import "../utils/indent.typ": fake-par

#let mainmatter(
  // documentclass 传入参数
  fonts: (:),
  // 其他参数
  leading: 1.25em,
  spacing: 1.25em,
  justify: true,
  first-line-indent: 2em,
  numbering: custom-numbering.with(first-level: "第一章 ", depth: 3, "1.1 "),
  ..args,
  it,
) = {
  // 0. 标志前言结束
  anti-front-end(..args)

  // 1. 设置基本样式
  fonts = 字体 + fonts
  set text(font: fonts.宋体, size: 字号.小四)
  set par(
    leading: leading,
    justify: justify,
    first-line-indent: first-line-indent
  )
  show par: set block(spacing: spacing)

  // 2.  处理标题
  // 2.1 大标题居中
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set align(center)
    it
  }
  // 2.2 设置标题的 Numbering
  set heading(numbering: numbering)
  // 2.3 加入假段落模拟首行缩进
  show heading: it => it + fake-par

  it
}