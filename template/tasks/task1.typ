#import "../../src/lib.typ": solution, source, task

#task(points: 10, title: "Compiler vs. Interpreter")[
  *Erklären Sie den Unterschied zwischen Compiler und Interpreter. Nennen Sie jeweils zwei Vor- und Nachteile.*
]

#solution[
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
]
