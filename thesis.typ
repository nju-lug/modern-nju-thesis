#import "functions/metavalue.typ": metavalue
#import "template.typ": conf

#show: conf

#metavalue("info", (
  department: "某学院",
  major: "某专业",
  author: "张三",
  student-id: "1234567890",
  supervisor: "李四",
))

#metavalue("anonymous", true)

Content