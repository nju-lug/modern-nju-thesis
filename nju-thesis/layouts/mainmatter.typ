#import "@preview/anti-matter:0.0.2": anti-front-end
#import "../utils/style.typ": 字号, 字体
#import "../utils/custom-numbering.typ": custom-numbering
#import "../utils/indent.typ": fake-par
#import "../utils/unpairs.typ": unpairs

#let mainmatter(
  // documentclass 传入参数
  fonts: (:),
  // 其他参数
  leading: 1.25em,
  spacing: 1.25em,
  justify: true,
  first-line-indent: 2em,
  numbering: custom-numbering.with(first-level: "第一章 ", depth: 3, "1.1 "),
  // 正文字体与字号参数
  text-args: auto,
  // 标题字体与字号
  heading-font: auto,
  heading-size: (字号.四号,),
  heading-weight: ("regular",),
  heading-top-vspace: (20pt, 0pt),
  heading-bottom-vspace: (20pt, 12pt),
  heading-pagebreak: (true, false),
  heading-align: (center, auto),
  ..args,
  it,
) = {
  // 0. 标志前言结束
  anti-front-end()

  // 1. 默认参数
  fonts = 字体 + fonts
  if (text-args == auto) {
    text-args = (font: fonts.宋体, size: 字号.小四)
  }
  // 字体与字号
  if (heading-font == auto) {
    heading-font = (fonts.黑体,)
  }
  // 处理 heading- 开头的其他参数
  let heading-text-args-lists = args.named().pairs()
    .filter((pair) => pair.at(0).starts-with("heading-"))
    .map((pair) => (pair.at(0).slice("heading-".len()), pair.at(1)))

  // 2. 辅助函数
  let array-at(arr, pos) = {
    arr.at(calc.min(pos, arr.len()) - 1)
  }

  // 3. 设置基本样式
  set text(..text-args)
  set par(
    leading: leading,
    justify: justify,
    first-line-indent: first-line-indent
  )
  show par: set block(spacing: spacing)
  show footnote.entry: set text(font: fonts.宋体, size: 字号.五号)

  // 4.  处理标题
  // 4.1 设置标题的 Numbering
  set heading(numbering: numbering)
  // 4.2 设置字体字号并加入假段落模拟首行缩进
  show heading: it => {
    set text(
      font: array-at(heading-font, it.level),
      weight: array-at(heading-weight, it.level),
      ..unpairs(heading-text-args-lists
        .map((pair) => (pair.at(0), array-at(pair.at(1), it.level))))
    )
    v(array-at(heading-top-vspace, it.level))
    it
    v(array-at(heading-bottom-vspace, it.level))
    fake-par
  }
  // 4.3 标题居中与换页
  show heading: it => {
    if (array-at(heading-pagebreak, it.level)) {
      pagebreak(weak: true)
    }
    if (array-at(heading-align, it.level) != auto) {
      set align(array-at(heading-align, it.level))
      it
    } else {
      it
    }
  }

  it
}