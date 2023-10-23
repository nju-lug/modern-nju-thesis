#import "../functions/chinese-style.typ": *
#import "../info.typ": *
#import "../style.typ": *

#let anony = false

  // 封面
#align(center)[
    // hust logo
    #v(30pt)

    // 匿名化处理需要去掉个人、机构信息
    #let logo_path = if not anony {
      "../assets/vi/nju-emblem.svg"
    } else {
      "../assets/vi/nju-emblem.svg"
    }
    #image(logo_path, width: 20%)

    #v(50pt)

    #text(
      size: 36pt,
      font: 字体.宋体,
      weight: "bold"
    )[本科生毕业设计(论文)]

    #v(40pt)

    #text(
      font: 字体.黑体,
      size: 22pt,
    )[
      中文论文题目
    ]

    #v(100pt)

    #let info_value(body) = {
      rect(
        width: 100%,
        inset: 2pt,
        stroke: (
          bottom: 1pt + black
        ),
        text(
          font: 字体.宋体,
          size: 16pt,
          bottom-edge: "descender"
        )[
          #body
        ]
      ) 
    }
    
    #let info_key(body) = {
      rect(width: 100%, inset: 2pt, 
       stroke: none,
       text(
        font: 字体.宋体,
        size: 16pt,
        body
      ))
    }

    #grid(
      columns: (70pt, 180pt),
      rows: (40pt, 40pt),
      gutter: 3pt,
      info_key("院　　系"),
      info_value(if not anony { 学校 } else { "██████████" }),
      info_key("专业班级"),
      info_value(if not anony { 专业 } else { "██████████" }),
      info_key("姓　　名"),
      info_value(if not anony { 中文作者名 } else { "██████████" }),
      info_key("学　　号"),
      info_value(if not anony { 学号 } else { "██████████" }),
      info_key("指导教师"),
      info_value(if not anony { 中文导师名 } else { "██████████" }),
    )
    #pagebreak()
  ]