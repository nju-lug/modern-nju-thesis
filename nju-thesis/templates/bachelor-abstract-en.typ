#import "@preview/t4t:0.3.2": is
#import "../utils/style.typ": 字号, 字体
#import "../utils/indent.typ": fake-par
#import "../utils/double-underline.typ": double-underline

#let bachelor-abstract-en(
  // documentclass 传入的参数
  anonymous: false,
  info: (:),
  // 其他参数
  keywords: (),
  anonymous-info-keys: ("author-en", "supervisor-en"),
  leading: 1.08em,
  spacing: 1.08em,
  body,
) = {
  // 1.  默认参数
  info = (
    title-en: "NJU Thesis Template for Typst",
    author-en: "Zhang San",
    department-en: "XX Department",
    major-en: "XX Major",
    supervisor-en: ("Li Si", "Professor"),
  ) + info

  // 2.  对参数进行处理
  // 2.1 如果是字符串，则使用换行符将标题分隔为列表
  if (is.str(info.title-en)) {
    info.title-en = info.title-en.split("\n")
  }

  // 3.  内置辅助函数
  let info-value(key, body) = {
    if (not anonymous or (key not in anonymous-info-keys)) {
      body
    }
  }

  // 4.  正式渲染
  [
    #set text(font: 字体.楷体, size: 字号.小四)
    #set par(leading: leading, justify: true)
    #show par: set block(spacing: spacing)

    #align(center)[
      #set text(size: 字号.小二, weight: "bold")

      #double-underline[南京大学本科生毕业论文（设计、作品）英文摘要]
    ]

    THESIS: #info-value("title-en", (("",)+ info.title-en).sum())

    DEPARTMENT: #info-value("department-en", info.department-en)

    SPECIALIZATION: #info-value("major-en", info.major-en)

    UNDERGRADUATE: #info-value("author-en", info.author-en)

    MENTOR: #info-value("supervisor-en", info.supervisor-en.at(1) + " " + info.supervisor-en.at(0))

    ABSTRACT:

    #[
      #set par(first-line-indent: 2em)

      #fake-par
      
      #body
    ]

    #v(1em)

    KEYWORDS: #(("",)+ keywords.intersperse("; ")).sum()
  ]

  pagebreak()
}