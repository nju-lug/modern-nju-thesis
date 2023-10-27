#let acknowledgement(
  // documentclass 传入参数
  anonymous: false,
  // 其他参数
  title: "致　　谢",
  body,
) = {
  if (not anonymous) {
    [
      #heading(level: 1, numbering: none, title)

      #body
    ]
  }
}