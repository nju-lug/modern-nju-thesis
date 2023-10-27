#let unpairs(pairs) = {
  let dict = (:)
  for pair in pairs {
    dict.insert(..pair)
  }
  dict
}