#import "../../src/lib.typ": source, subtask, task

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

  Dieser Code wurde generiert. #source("gemini", model: "Gemini 3 Pro", prompt: "Schreibe eine rekursive Fakultätsfunktion in Python.")
]

Wie im Studienheft beschrieben @wbh_studienheft, ist die Rekursion ein wichtiges Konzept.
