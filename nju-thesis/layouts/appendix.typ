#import "../utils/custom-numbering.typ": custom-numbering

#let appendix(it) = {
  set heading(numbering: custom-numbering.with(first-level: "附录 A  ", "A.1"))
  counter(heading).update(0)
  it
}