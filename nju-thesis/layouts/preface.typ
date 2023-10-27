#import "@preview/anti-matter:0.0.2": anti-matter

// 前言，重置页面计数器
#let preface(
  spec: (front: "I", inner: "1", back: "I"),
  ..args,
  it,
) = {
  counter(page).update(0)
  anti-matter(spec: spec, ..args, it)
}