#import "../info.typ"
#import "../functions/chinese-style.typ": 字号
#import "../style.typ": 字体

#let anony = false

// 封面
#align(center)[

  // 封面图标
  #v(6pt)
  // 匿名化处理需要去掉个人、机构信息
  #image("../assets/vi/nju-emblem.svg", width: 2.38cm)
  #v(22pt)
  // 调整一下左边的间距
  #pad(image("../assets/vi/nju-name.svg", width: 10.5cm), left: 0.4cm)

  #v(20pt)

  // 将中文之间的空格间隙从 0.25 em 调整到 0.5 em
  #text(size: 字号.一号, font: 字体.宋体, spacing: 200%, weight: "bold")[本 科 毕 业 论 文]
  
  #v(66pt)
  
  #let info_value(body) = {
    rect(
      width: 100%,
      inset: 2pt,
      stroke: (bottom: 1pt + black),
      text(font: 字体.宋体, size: 字号.三号, bottom-edge: "descender")[
        #body
      ],
    )
  }
   
  #let info_key(body) = {
    rect(
      width: 100%,
      inset: 2pt,
      stroke: none,
      text(font: 字体.宋体, size: 字号.三号, body),
    )
  }
  
  #grid(
    columns: (70pt, 240pt),
    rows: (28pt, 28pt),
    gutter: 3pt,
    info_key("院　　系"),
    info_value(if not anony { info.学校 } else { "██████████" }),
    info_key("专　　业"),
    info_value(if not anony { info.专业 } else { "██████████" }),
    info_key("姓　　名"),
    info_value(if not anony { info.中文作者名 } else { "██████████" }),
    info_key("学　　号"),
    info_value(if not anony { info.学号 } else { "██████████" }),
    info_key("指导教师"),
    info_value(if not anony { info.中文导师名 } else { "██████████" }),
  )

  #pagebreak(weak: true)
]