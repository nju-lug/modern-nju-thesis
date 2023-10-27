#import "@preview/i-figured:0.1.0"
#import "../utils/i-equation.typ"
#import "../utils/custom-numbering.typ": custom-numbering

// 后记，重置 heading 计数器
#let appendix(
  numbering: custom-numbering.with(first-level: "附录 A ", depth: 3, "A.1 "),
  // figure 计数
  show-figure: i-figured.show-figure.with(numbering: "A.1"),
  // equation 计数
  show-equation: i-equation.show-equation.with(numbering: "(A.1)"),
  it,
) = {
  set heading(numbering: numbering)
  counter(heading).update(0)
  // 设置 figure 的编号
  show figure: show-figure
  // 设置 equation 的编号
  show math.equation: show-equation
  it
}