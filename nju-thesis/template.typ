#import "conf.typ": conf
#import "templates/bachelor-cover.typ": bachelor-cover
#import "templates/bachelor-decl-page.typ": bachelor-decl-page
#import "templates/bachelor-abstract.typ": bachelor-abstract
#import "templates/bachelor-abstract-en.typ": bachelor-abstract-en

#let documentclass(
  type: "bachelor",
  degree: "academic",
  twoside: true,  // 双面模式，会加入空白页，便于打印
  anonymous: false,  // 盲审模式
  cjk-font: auto,
  latin-font: auto,
  math-font: auto,
  fallback: false,  // 字体缺失时使用 fallback，不显示豆腐块
  info: (:),
) = {
  // 默认参数
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
    conf: (it) => conf(
      fallback: fallback,
      it,
    ),
    cover: (..args) => {
      bachelor-cover(
        anonymous: anonymous,
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
    decl-page: (..args) => {
      bachelor-decl-page(
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
    abstract: (..args) => {
      bachelor-abstract(
        anonymous: anonymous,
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
    abstract-en: (..args) => {
      bachelor-abstract-en(
        anonymous: anonymous,
        ..args,
        info: info + args.named().at("info", default: (:)),
      )
    },
  )
}
