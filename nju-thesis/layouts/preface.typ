#import "@preview/anti-matter:0.0.2": anti-matter

#let preface(..args, it) = {
  counter(page).update(0)
  anti-matter(..args, it)
}