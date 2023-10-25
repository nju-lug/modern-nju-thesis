#import "@preview/t4t:0.3.2": is
#import "@preview/tablex:0.0.6": gridx, colspanx
#import "../utils/datetime-display.typ": datetime-display
#import "../utils/chinese-style.typ": 字号, 字体

// 封面
#let bachelor-cover(
  // documentclass 传入的参数
  anonymous: false,
  info: (:),
  // 其他参数
  title-lines: auto,
  min-title-lines: 2,
  info-inset: (x: 0pt, bottom: 1pt),
  info-key-width: 74pt,
  column-gutter: -8pt,
  row-gutter: 1pt,
  anonymous-info-keys: ("grade", "student-id", "author", "supervisor"),
  datetime-display: datetime-display,
) = {
  // 1.  默认参数
  info = (
    title: ("南京大学学位论文", "Typst 模板"),
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    department: "某学院",
    major: "某专业",
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
  ) + info

  // 2.  对 auto 参数进行处理
  // 2.1 如果是 auto 则展示为 >= min-title-lines 行
  if (title-lines == auto) {
    if (is.str(info.title)) {
      info.title = info.title.split("\n")
    }
    if (info.title.len() >= min-title-lines) {
      title-lines = info.title.len()
    } else {
      title-lines = min-title-lines;
    }
  }
  // 2.2 处理提交日期
  if (is.type(datetime, info.submit-date)) {
    info.submit-date = datetime-display(info.submit-date)
  }

  // 3.  内置辅助函数
  let info-key(body) = {
    rect(
      width: 100%,
      inset: info-inset,
      stroke: none,
      text(font: 字体.楷体, size: 字号.三号, body),
    )
  }

  let info-value(body) = {
    set align(center)
    rect(
      width: 100%,
      inset: info-inset,
      stroke: (bottom: 1pt + black),
      text(font: 字体.宋体, size: 字号.三号, bottom-edge: "descender", body),
    )
  }

  let info-long-value(key, body) = {
    colspanx(3,
      info-value(
        if (anonymous and (key in anonymous-info-keys)) {
          "██████████"
        } else {
          body
        }
      )
    )
  }

  let info-short-value(key, body) = {
    info-value(
      if (anonymous and (key in anonymous-info-keys)) {
        "█████"
      } else {
        body
      }
    )
  }
  

  // 4.  正式渲染
  // 居中对齐
  set align(center)

  // 匿名化处理去掉封面标识
  if (anonymous) {
    v(70pt)
  } else {
    // 封面图标
    v(6pt)
    image("../assets/vi/nju-emblem.svg", width: 2.38cm)
    v(22pt)
    // 调整一下左边的间距
    pad(image("../assets/vi/nju-name.svg", width: 10.5cm), left: 0.4cm)
    v(20pt)
  }

  // 将中文之间的空格间隙从 0.25 em 调整到 0.5 em
  text(size: 字号.一号, font: 字体.宋体, spacing: 200%, weight: "bold")[本 科 毕 业 论 文]
  
  if (anonymous) {
    v(132pt)
  } else {
    v(44pt)
  }

  block(width: 300pt, gridx(
    columns: (info-key-width, 1fr, info-key-width, 1fr),
    column-gutter: column-gutter,
    row-gutter: row-gutter,
    info-key("院　　系"),
    info-long-value("department", info.department),
    info-key("专　　业"),
    info-long-value("major", info.major),
    info-key("题　　目"),
    info-long-value("major", info.major),
    info-key("年　　级"),
    info-short-value("grade", info.grade),
    info-key("学　　号"),
    info-short-value("student-id", info.student-id),
    info-key("学生姓名"),
    info-long-value("author", info.author),
    info-key("指导教师"),
    info-short-value("supervisor", info.supervisor.at(0)),
    info-key("职　　称"),
    info-short-value("supervisor", info.supervisor.at(1)),
    info-key("提交日期"),
    info-long-value("submit", info.submit-date),
  ))

  pagebreak(weak: true)
}