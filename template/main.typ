#import "../src/lib.typ": project, subtask, task

// --- Document Setup ---
#show: project.with(
  title: "B-Aufgabe: Grundlagen der Informatik",
  course: "CS101 - Einführung",
  student_name: "Max Mustermann",
  student_id: "900123456",
  semester: "WS 2024/25",
  date: datetime.today().display(),
)

// --- Solutions ---

#task(points: 10, title: "Compiler vs. Interpreter")[
  Erklären Sie den Unterschied zwischen Compiler und Interpreter. Nennen Sie jeweils zwei Vor- und Nachteile.
]

Ein *Compiler* übersetzt den gesamten Quellcode vor der Ausführung in Maschinencode.
- *Vorteil:* Schnellere Ausführung des resultierenden Programms.
- *Vorteil:* Compiler können globale Optimierungen durchführen.
- *Nachteil:* Der Kompilierungsschritt braucht Zeit.
- *Nachteil:* Fehler werden erst beim Kompilieren (nicht zur Laufzeit) sichtbar.

Ein *Interpreter* führt den Quellcode Zeile für Zeile direkt aus.
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
