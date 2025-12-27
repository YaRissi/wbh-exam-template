#import "../src/lib.typ": project, task, question, choice, answer-lines, answer-box

// --- Document Setup ---
#show: project.with(
  title: "B-Aufgabe 1: Grundlagen der Informatik",
  course: "CS101 - Einführung",
  student_name: "Max Mustermann",
  student_id: "900123456",
  semester: "WS 2024/25",
  date: "27.12.2025"
)

// --- Content ---

= Teil 1: Theorie

#task(points: 10)[
  Erklären Sie den Unterschied zwischen Compiler und Interpreter.
  
  #question[
    Nennen Sie jeweils zwei Vor- und Nachteile.
  ]
  
  // Space for the student to write the answer
  #answer-lines(count: 6)
]

#task(points: 5)[
  Welche der folgenden Sprachen ist *keine* objektorientierte Sprache?
  
  #choice((
    "Java",
    "C#",
    "C",
    "Python"
  ))
]

= Teil 2: Praxis

#task(points: 15)[
  Schreiben Sie eine Funktion in Pseudocode, die die Fakultät einer Zahl $n$ berechnet.
  
  #answer-box(height: 5cm)
]

#task(points: 20)[
  #question[
    Analysieren Sie den folgenden Code-Schnipsel auf Laufzeitkomplexität:
  ]
  ```python
  def example(n):
      for i in range(n):
          for j in range(n):
              print(i, j)
  ```
  
  #answer-lines(count: 4)
]
