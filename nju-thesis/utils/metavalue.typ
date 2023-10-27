#let prefix = "metavalue:"

// 设置一个类似全局变量的 metavalue
#let metavalue(key, value) = [
  #metadata(value) #label(prefix + key)
]

// 查询该 metavalue，默认取最后一个，没找到则回调 none
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