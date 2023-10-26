#let custom-numbering(base: 1, first-level: none, second-level: none, third-level: none, format, ..args) = {
    if (first-level != none and args.pos().len() == 1) {
        if (first-level != "") {
            numbering(first-level, ..args)
        }
        return
    }
    if (second-level != none and args.pos().len() == 2) {
        if (second-level != "") {
            numbering(second-level, ..args)
        }
        return
    }
    if (third-level != none and args.pos().len() == 3) {
        if (third-level != "") {
            numbering(third-level, ..args)
        }
        return
    }
    // default
    if (args.pos().len() >= base) {
        numbering(format, ..(args.pos().slice(base - 1)))
        return
    }
}