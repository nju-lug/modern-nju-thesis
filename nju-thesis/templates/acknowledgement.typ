// 致谢页
#let acknowledgement(
  // documentclass 传入参数
  anonymous: false,
  // 其他参数
  title: "致　　谢",
  outlined: true,
  body,
) = {
  if (not anonymous) {
    [
      #heading(level: 1, numbering: none, outlined: outlined, title)

      #body
    ]
  }
}