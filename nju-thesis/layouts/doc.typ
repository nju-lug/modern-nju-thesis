#let doc(
  fallback: false,  // 字体缺失时使用 fallback，不显示豆腐块
  margin: (x: 92pt),
  it,
) = {
  // 基本的样式设置
  set text(fallback: fallback)
  set page(margin: margin)

  it
}