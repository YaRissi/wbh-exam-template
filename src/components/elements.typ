#import "utils.typ": wbh-colors

// --- Helper Functions for Tasks ---

// Counter for tasks
#let task-counter = counter("task")

// Function to create a task section
#let task(points: none, body) = {
  task-counter.step()
  v(1em)
  block(
    fill: luma(245),
    inset: 10pt,
    radius: 4pt,
    stroke: luma(200),
    width: 100%,
    [
      #text(weight: "bold", fill: wbh-colors.primary)[Aufgabe #context task-counter.display()]:
      #if points != none [ (#points Punkte) ]
      #v(0.5em)
      #body
    ],
  )
}

// Function for sub-tasks or questions
#let question(body) = {
  pad(left: 1em, top: 0.5em, bottom: 0.5em, body)
}

// Function to create options (Multiple Choice)
#let choice(options) = {
  for opt in options [
    - #circle(radius: 3pt, stroke: 1pt + black) #h(0.5em) #opt
  ]
}

// Function to create space for answers (ruled lines)
#let answer-lines(count: 3) = {
  v(0.5em)
  set text(fill: wbh-colors.gray)
  for i in range(count) {
    line(length: 100%, stroke: (dash: "dotted"))
    v(0.8em)
  }
}

// Function for a generic answer box
#let answer-box(height: 3cm) = {
  v(0.5em)
  rect(
    width: 100%,
    height: height,
    stroke: 0.5pt + wbh-colors.gray,
    fill: white,
  )
}
