#import "templates/template.typ": documentclass

#let (
  conf,
  cover,
) = documentclass(
  // fallback: true,  // 字体缺失时使用 fallback，不显示豆腐块
  // anonymous: true,  // 盲审模式
  info: (
    title: [南京大学学位论文模板],
    title-en: [NJU Thesis Template],
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

#show: conf

#cover()

内容