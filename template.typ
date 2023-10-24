#import "functions/metavalue.typ": metavalue, query-metavalue
#import "templates/cover.typ": cover

#let conf(it) = {
  query-metavalue("anonymous", anonymous => {
    cover(anonymous: anonymous == true)
  })

  it
}
