#import "utils.typ": wbh-colors

// Main Project Function
#let project(
  last_name: "",
  first_name: "",
  assignment_code: "",
  street: "",
  zip_city: "",
  student_id: "",
  course_id: "",
  assignment_title: "",
  b_exam_name: "",
  variant: "",
  body,
) = {
  // Set document metadata
  set document(author: first_name + " " + last_name, title: assignment_title)

  // Set page properties (A4, margins, header/footer)
  set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    header: [
      #set text(8pt)
      #grid(
        columns: (1fr, 1fr),
        align(left)[#image("../assets/logo-wbh.jpg", width: 3cm)], align(right + bottom)[#assignment_code],
      )
      #line(length: 100%, stroke: 0.5pt + wbh-colors.primary)
    ],
    footer: [
      #set text(8pt)
      #line(length: 100%, stroke: 0.5pt + wbh-colors.gray)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left)[#first_name #last_name (#student_id)],
        align(center)[#assignment_title],
        align(right)[Seite #context counter(page).display("1 / 1", both: true)],
      )
    ],
  )

  // Set text properties
  set text(
    font: (
      "Arial",
      "Calibri",
      "Sans Serif Collection",
    ),
    size: 11pt,
    lang: "de",
  )

  // Heading Styling
  show heading.where(level: 1): it => {
    set text(fill: wbh-colors.primary, size: 14pt)
    block(below: 1em, it)
  }

  // Title Block
  align(left)[
    #text(1.5em, weight: "bold", fill: wbh-colors.primary)[#assignment_title] \
    #v(0.2em)
    #text(1.2em, fill: wbh-colors.gray)[#b_exam_name]
    #v(1.5em)
    #grid(
      columns: (auto, 1fr, auto, 1fr),
      column-gutter: (1em, 2em, 1em),
      row-gutter: 0.8em,

      [*Name:*], [#first_name #last_name], [*Studiengang:*], [#course_id],
      [*Matrikel-Nr.:*], [#student_id], [*Variante:*], [#variant],
      [*Anschrift:*], [#street \ #zip_city], [], [],
    )
  ]

  v(1cm)

  // Main Content
  body
}
