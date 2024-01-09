// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!

#let docFontSize = 12pt

#let headNumber(loc) = {
  let levels = counter(heading).at(loc)
  levels.map(str).join(".") 
}

#let fullPageTitle(it, loc) = {
  set text(size: 2*docFontSize)
  set page(numbering: none)
  set align(horizon + center)
  it.body
}

#let sectionTitle(it, loc, fontMultiplier) = {
  set text(size: fontMultiplier*docFontSize)
  headNumber(loc)     
  h(0.5em)
  it.body
  v(0.1em)
}

#let inlineTitle(it, loc) = {
  v(1em)
  set text(size: 1.25*docFontSize)
  it.body
  v(0.5em)
}
#let headFormatter(it) = {
locate(loc => {    
    if(it.level == 1){
      fullPageTitle(it, loc)
    } else if(it.level == 2) {
      sectionTitle(it, loc, 1.75)
    } else if(it.level == 3) {
      sectionTitle(it, loc, 1.5)
    } else {
      inlineTitle(it, loc)
    }
  })

}

#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: end)
  
  set text(font: "Arial", lang: "es", size: docFontSize)
  set enum(indent: 1em)
  set list(marker: [-])
  set heading(numbering: "1.1.1")
  show link: underline
  show heading: headFormatter
  show math.equation: set text(size: 1.25*docFontSize)
  // Title row.
  align(center + horizon )[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: true)

  body
}