#import "nju-thesis/template.typ": documentclass

#let (
  doc, preface, mainmatter, mainmatter-end, appendix,
  fonts-display-page,
  cover, decl-page, abstract, abstract-en, outline-page,
) = documentclass(
  // anonymous: true,  // 盲审模式
  // fonts: (楷体: ("Times New Roman", "FZKai-Z03S")),  // 可自定义字体，先英文字体后中文字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
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

= 引言

== 引言子标题

=== 引言子子标题

==== 引言子子子标题

量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力，量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力。

量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力，量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力。

==== 量子计算

量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力，量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力。

量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力，量子位的不稳定性和有限的量子比特数量限制了量子计算机的复杂度和纠错能力。


= 正文

== 正文子标题

=== 正文子子标题

#("正文内容" * 20)

#("正文内容" * 20)

#("正文内容" * 20)

// 正文结束标志，不可缺少
#mainmatter-end()


// 附录
#show: appendix

= 附录

== 附录子标题

=== 附录子子标题

附录内容