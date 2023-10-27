#import "@preview/anti-matter:0.0.2": anti-inner-end as mainmatter-end
#import "layouts/doc.typ": doc
#import "layouts/preface.typ": preface
#import "layouts/mainmatter.typ": mainmatter
#import "layouts/appendix.typ": appendix
#import "templates/fonts-display-page.typ": fonts-display-page
#import "templates/bachelor-cover.typ": bachelor-cover
#import "templates/bachelor-decl-page.typ": bachelor-decl-page
#import "templates/bachelor-abstract.typ": bachelor-abstract
#import "templates/bachelor-abstract-en.typ": bachelor-abstract-en
#import "templates/bachelor-outline-page.typ": bachelor-outline-page
#import "templates/acknowledgement.typ": acknowledgement
#import "utils/custom-numbering.typ": custom-numbering
#import "utils/custom-tablex.typ": *
#import "utils/indent.typ": indent
#import "utils/style.typ": 字体
#import "utils/style.typ": 字号

#let documentclass(
  type: "bachelor",  // TODO: 
  degree: "academic",  // TODO: 
  twoside: true,  // TODO: 双面模式，会加入空白页，便于打印
  anonymous: false,  // 盲审模式
  fonts: (:),  // 字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  math-font: auto,  // TODO: 
  info: (:),
) = {
  // 默认参数
  fonts = 字体 + fonts
  info = (
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
    field: "某方向",
    field-en: "XX Field",
    supervisor: ("李四", "教授"),
    supervisor-en: ("Li Si", "Professor"),
    supervisor-ii: (),
    supervisor-ii-en: (),
    submit-date: datetime.today(),
    defend-date: datetime.today(),
    confer-date: datetime.today(),
    bottom-date: datetime.today(),
    chairman: (),
    reviewer: (),
    clc: "",
    udc: "",
    secret-level: "",
    supervisor-contact: "",
    school-code: "10284",
    degree: auto,
    degree-en: auto,
  ) + info

  (
    doc: (..args) => {
      doc(
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
    preface: (..args) => {
      preface(
        ..args,
      )
    },
    mainmatter: (..args) => {
      mainmatter(
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },
    mainmatter-end: (..args) => {
      mainmatter-end(
        ..args,
      )
    },
    appendix: (..args) => {
      appendix(
        ..args,
      )
    },
    fonts-display-page: (..args) => {
      fonts-display-page(
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },
    cover: (..args) => {
      bachelor-cover(
        anonymous: anonymous,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
        info: info + args.named().at("info", default: (:)),
      )
    },
    decl-page: (..args) => {
      bachelor-decl-page(
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
        info: info + args.named().at("info", default: (:)),
      )
    },
    abstract: (..args) => {
      bachelor-abstract(
        anonymous: anonymous,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
        info: info + args.named().at("info", default: (:)),
      )
    },
    abstract-en: (..args) => {
      bachelor-abstract-en(
        anonymous: anonymous,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
        info: info + args.named().at("info", default: (:)),
      )
    },
    outline-page: (..args) => {
      bachelor-outline-page(
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },
    acknowledgement: (..args) => {
      acknowledgement(
        anonymous: anonymous,
        ..args,
      )
    },
  )
}
