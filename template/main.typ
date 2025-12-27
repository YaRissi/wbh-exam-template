#import "../src/lib.typ": project, subtask, task, source

// --- Document Setup ---
#show: project.with(
  last_name: "Mustermann",
  first_name: "Max",
  assignment_code: "B-XXXX-XXXXX-XX",
  street: "Musterstraße 1",
  zip_city: "12345 Musterstadt",
  student_id: "900123456",
  course_id: "XXXXXXX",
  assignment_title: "Grundlagen der Informatik",
  b_exam_name: "Name der B-Aufgabe",
  variant: "XXXXXXX",
)

// --- Solutions ---

#task(points: 10, title: "Compiler vs. Interpreter")[
  Erklären Sie den Unterschied zwischen Compiler und Interpreter. Nennen Sie jeweils zwei Vor- und Nachteile.
]

Ein *Compiler* übersetzt den gesamten Quellcode vor der Ausführung in Maschinencode. #source("wbh_studienheft", supplement: "S. 5")
- *Vorteil:* Schnellere Ausführung des resultierenden Programms.
- *Vorteil:* Compiler können globale Optimierungen durchführen.
- *Nachteil:* Der Kompilierungsschritt braucht Zeit.
- *Nachteil:* Fehler werden erst beim Kompilieren (nicht zur Laufzeit) sichtbar.

Ein *Interpreter* führt den Quellcode Zeile für Zeile direkt aus. #source("wbh_studienheft", supplement: "S. 8")
- *Vorteil:* Einfacheres Debugging und Testen ("REPL").
- *Vorteil:* Plattformunabhängigkeit (sofern der Interpreter verfügbar ist).
- *Nachteil:* Langsamere Ausführung.
- *Nachteil:* Fehler treten erst zur Laufzeit auf.


#task(points: 15)[
  Berechnen Sie die Fakultät von 5.
]

Die Fakultät $n!$ ist definiert als:
$ n! = n dot (n-1) dot ... dot 1 $

Für $n=5$:
$
  5! & = 5 dot 4 dot 3 dot 2 dot 1 \
     & = 120
$

#task(points: 20, title: "Programmierung")[
  Schreiben Sie eine Funktion `factorial(n)`.
]

#subtask(title: "a) Pseudocode")[
  Hier ist der Algorithmus in Pseudocode:
  ```
  function factorial(n):
      if n == 0 return 1
      return n * factorial(n - 1)
  ```
]

#subtask(title: "b) Python-Implementierung")[
  ```python
  def factorial(n):
      """Berechnet n! rekursiv."""
      if n == 0:
          return 1
      return n * factorial(n - 1)
  ```
]

Wie im Studienheft beschrieben @wbh_studienheft, ist die Rekursion ein wichtiges Konzept.

// --- Bibliography ---
#pagebreak()
#bibliography("references.bib", style: "apa", title: "Literaturverzeichnis")
