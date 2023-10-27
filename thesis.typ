#import "nju-thesis/template.typ": documentclass, tablex, fig, tlt
// import the package
#import "@preview/i-figured:0.1.0"

#let (
  doc, preface, mainmatter, mainmatter-end, appendix,
  fonts-display-page,
  cover, decl-page, abstract, abstract-en, outline-page, acknowledgement,
) = documentclass(
  // anonymous: true,  // 盲审模式
  // 可自定义字体，先英文字体后中文字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  // fonts: (楷体: ("Times New Roman", "FZKai-Z03S")),
  info: (
    title: ("基于 Typst 的", "南京大学学位论文"),
    title-en: "NJU Thesis Template for Typst",
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    author-en: "Zhang San",
    department: "某学院",
    department-en: "XX Department",
    major: "某专业",
    major-en: "XX Major",
    supervisor: ("李四", "教授"),
    supervisor-en: ("Li Si", "Professor"),
    submit-date: datetime.today(),
  ),
)

// 文稿设置
#show: doc

// 字体展示测试页
// #fonts-display-page()

// 封面页
#cover()

// 声明页
#decl-page()


// 前言
#show: preface

// 中文摘要
#abstract(
  keywords: ("我", "就是", "测试用", "关键词")
)[
  中文摘要
]

// 英文摘要
#abstract-en(
  keywords: ("Dummy", "Keywords", "Here", "It Is")
)[
  English abstract
]

// 目录
#outline-page()

// 正文
#show: mainmatter

= 基本功能

== 脚注

我们可以添加一个脚注。#footnote[脚注内容]

== 图表

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:nju-logo。引用图表时，表格、图片和代码分别需要加上 `tbl:`、`fig:` 和 `lst:` 前缀才能正常显示编号。以及这里使用 `fig` 替代原生 `figure` 以支持将 `tablex` 作为表格来识别。

#align(center, (stack(dir: ltr)[
  #fig(
    tablex(
      align: center + horizon,
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [常规表],
  ) <timing>
][
  #h(50pt)
][
  #fig(
    tlt(
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [三线表],
  ) <timing-tlt>
]))

#fig(
  image("nju-thesis/assets/vi/nju-emblem.svg", width: 20%),
  caption: [图片测试],
) <nju-logo>


== 代码块

```py
def add(x, y):
  return x + y
```

== 数学公式

行内公式 $x + y$ 以及行间公式

$ x^2 + y^2 = 1 $

= 正文

== 正文子标题

=== 正文子子标题

正文内容


#acknowledgement[
  致谢内容
]

// 正文结束标志，不可缺少
#mainmatter-end()


// 附录
#show: appendix

= 附录

== 附录子标题

=== 附录子子标题

附录内容