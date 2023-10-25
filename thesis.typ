#import "templates/template.typ": documentclass

#let (
  conf,
  cover,
) = documentclass(
  // fallback: true,  // 字体缺失时使用 fallback，不显示豆腐块
  // anonymous: true,  // 盲审模式
  info: (
    author: "name",
  ),
)

#show: conf

#cover()

内容