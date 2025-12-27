#import "utils.typ": wbh-colors

// --- Helper Functions for Solutions ---

// Counter for tasks
#let task-counter = counter("task")

// Function to create a task header
#let task(points: none, title: none, ..args) = {
  let body = args.pos().at(0, default: none)
  task-counter.step()
  v(1.5em)
  block(
    width: 100%,
    stroke: (bottom: 1pt + wbh-colors.primary),
    inset: (bottom: 0.5em),
    [
      #text(
        1.2em,
        weight: "bold",
        fill: wbh-colors.primary,
      )[Aufgabe #context task-counter.display()]
      #if title != none [ : #title ]
      #if points != none [ #h(1fr) #text(style: "italic")[#points Punkte] ]
    ],
  )
  v(0.5em)
  if body != none {
    block(
      fill: luma(250),
      inset: 10pt,
      radius: 4pt,
      width: 100%,
      text(style: "italic", body),
    )
    v(1em)
  }
}

// Function for sub-tasks (a, b, c...)
#let subtask(title: none, points: none, body) = {
  v(0.5em)
  grid(
    columns: (auto, 1fr, auto),
    gutter: 0.5em,
    text(weight: "bold", title),
    text(style: "italic", body),
    if points != none {
      align(right, text(style: "italic")[#points Pkt.])
    },
  )
  v(0.5em)
}

// Function to format the solution
#let solution(body) = {
  pad(left: 1.5em)[
    #body
  ]
  v(2em)
}

// Function to add a source reference (superscript citation)
#let source(key, supplement: none, model: none, prompt: none) = {
  super(cite(label(key), supplement: supplement))
  if prompt != none {
    footnote[
      #if model != none [*Modell:* #model. ]
      *Prompt:* "#prompt"
    ]
  }
}
