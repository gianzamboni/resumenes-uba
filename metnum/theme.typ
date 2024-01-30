// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#import "@preview/colorful-boxes:1.2.0": outlinebox
#import "@preview/algo:0.3.3": algo, i, d

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

#let nonNumberedSectionTitle(it, loc, multiplier) = {
  v(0.5em)
  set text(size: multiplier*docFontSize)
  it.body
  v(1em, weak: true)
}

#let inlineTitle(it, loc, multiplier) = {
  set text(size: multiplier*docFontSize)
  v(1em)
  it.body
  linebreak()
}

#let headFormatter(it) = {
locate(loc => {    
    if(it.level == 1){
      fullPageTitle(it, loc)
    } else if(it.level == 2) {
      pagebreak()
      sectionTitle(it, loc, 1.75)
    } else if(it.level == 3) {
      sectionTitle(it, loc, 1.5)
    } else if(it.level == 4) {
      inlineTitle(it, loc, 1.25)
    } else {
      inlineTitle(it, loc, 1)}
  })
}

#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(
    author: authors, 
    title: title
  )

  set enum(indent: 1em)
  set heading(numbering: "1.1.1")
  set list(
    marker: [$#text(size: 10pt, $bullet$)$], 
    indent: 1em
  )
  set math.mat(delim: "[")
  set page(numbering: "1", number-align: end)
  set text(font: "Lato", lang: "es", size: docFontSize)

  show heading: headFormatter
  show link: underline
  show math.equation: set text(weight: "bold")
  show strong: set text(blue)
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

  #let demoLine(title: "") = {
  pad(top: 1em, bottom: -0.75em)[*Demostración #title*]
  line(
    length: 100%,
    stroke: 1pt + color.blue,
  )
}
#let coloredBox(title: "", defaultTitle: "", color: "", body) = {
  if(title == "") {
    title = defaultTitle
  }
  outlinebox(title: title, color: color, radius: 2pt)[
  #pad(1em)[#body]
  #v(0.5em)
]
}

#let propiedad(title: "", body) = {
  coloredBox(title: title, defaultTitle: "Propiedad", color: "blue", body)
}

#let corolario(title: "", body) = {
  coloredBox(title: title, defaultTitle: "Corolario", color: "green", body)
}


#let alert(title: "", body) = {
  coloredBox(title: title, defaultTitle: "¡Cuidado!", color: "red", body)
}

#let rang = math.op("rang")
#let fila = math.op("fila")
#let col = math.op("col")

#let blue(body) = text(color.blue, weight: "bold", body)

#let pseudo(title: "", parameters: (), body) = {
  show strong: set text(black)
  algo(
    body,
    title: title,
    parameters: parameters,
    strong-keywords: true, 
    keywords: ("Para", "hacer", "Fin")
  )
}