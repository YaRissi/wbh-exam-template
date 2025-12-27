#import "../src/lib.typ": project

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
  edition: "XXXXXXX",
)

// --- Solutions ---

#include "tasks/task1.typ"
#include "tasks/task2.typ"
#include "tasks/task3.typ"

// --- Bibliography ---
#pagebreak()
#bibliography("references.bib", style: "apa", title: "Literaturverzeichnis")
