#let prefix = "metavalue:"

#let metavalue(key, value) = [
  #metadata(value) #label(prefix + key)
]

#let query-metavalue(key, callback) = {
  locate(loc => {
    let last = query(label(prefix + key), loc).at(-1, default: none)
    if (last != none) {
      callback(last.value)
    } else {
      callback(none)
    }
  })
}