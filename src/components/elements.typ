#import "utils.typ": wbh-colors

// --- Helper Functions for Solutions ---

// Counter for tasks
#let task-counter = counter("task")

// Function to create a task header
#let task(points: none, title: none, body) = {
  task-counter.step()
  v(1.5em)
  block(
    width: 100%,
    stroke: (bottom: 1pt + wbh-colors.primary),
    inset: (bottom: 0.5em),
    [
      #text(1.2em, weight: "bold", fill: wbh-colors.primary)[Aufgabe #context task-counter.display()]
      #if title != none [ : #title ]
      #if points != none [ #h(1fr) #text(style: "italic")[#points Punkte] ]
    ]
  )
  v(0.5em)
  if body != none {
    block(
      fill: luma(250),
      inset: 10pt,
      radius: 4pt,
      width: 100%,
      text(style: "italic", body)
    )
    v(1em)
  }
}

// Function for sub-tasks (a, b, c...)
#let subtask(title: none, body) = {
  v(0.5em)
  text(weight: "bold")[#title]
  h(0.5em)
  body
  v(0.5em)
}
