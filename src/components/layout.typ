#import "utils.typ": wbh-colors

// Main Project Function
#let project(
  title: "",
  course: "",
  date: datetime.today().display(),
  student_name: "",
  student_id: "",
  semester: "",
  body,
) = {
  // Set document metadata
  set document(author: student_name, title: title)

  // Set page properties (A4, margins, header/footer)
  set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    header: [
      #set text(8pt)
      #grid(
        columns: (1fr, 1fr),
        align(left)[#image("../assets/logo-wbh.jpg", width: 4cm)],
        align(right)[#title \ #date],
      )
      #line(length: 100%, stroke: 0.5pt + wbh-colors.primary)
    ],
    footer: [
      #set text(8pt)
      #line(length: 100%, stroke: 0.5pt + wbh-colors.gray)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left)[#student_name (#student_id)],
        align(center)[Semester: #semester],
        align(right)[Page #context counter(page).display("1 of 1")],
      )
    ],
  )

  // Set text properties
  set text(font: "Arial", size: 11pt, lang: "de")
  // show math.equation: set text(font: "Fira Math")

  // Heading Styling
  show heading.where(level: 1): it => {
    set text(fill: wbh-colors.primary, size: 14pt)
    block(below: 1em, it)
  }

  // Title Block
  align(center)[
    #text(1.5em, weight: "bold", fill: wbh-colors.primary)[#title] \
    #v(0.5em)
    #text(1.2em)[#course] \
    #v(1em)
    #grid(
      columns: (auto, auto),
      gutter: 2em,
      align(left)[
        *Student:* #student_name \
        *Matrikel-Nr.:* #student_id
      ],
      align(left)[
        *Datum:* #date \
        *Semester:* #semester
      ],
    )
  ]

  v(1cm)

  // Main Content
  body
}
