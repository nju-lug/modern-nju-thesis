#import "../utils/indent.typ": fake-par
#import "../utils/style.typ": 字号, 字体

#let bachelor-abstract(keywords: (), it) = [
  #set text(font: 字体.楷体, size: 字号.小四)

  #align(center)[
    #set text(size: 字号.小二)

    南京大学本科生毕业论文（设计、作品）中文摘要
  ]

  *题目*：题目

  *院系*：院系

  *专业*：专业

  *本科生姓名*：本科生姓名

  *指导教师（姓名、职称）*：导师姓名教授

  *摘要*：

  #[
    #set par(first-line-indent: 2em)

    #fake-par
    
    #it
  ]

  *关键词*：#keywords.intersperse("；").sum()

  #pagebreak()
]