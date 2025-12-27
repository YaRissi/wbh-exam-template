# WBH Typst Template (B-Aufgabe)

Unofficial Typst template for "B-Aufgaben" (assignments) at the Wilhelm Büchner Hochschule (WBH), utilizing WBH colors.

## Usage

### 1. Document Setup

Import the template and configure your details in the `project` function in `template/main.typ`:

```typst
#import "../src/lib.typ": project

#show: project.with(
  last_name: "Mustermann",
  first_name: "Max",
  assignment_code: "B-XXXXXXXXX",
  street: "Musterstraße 1",
  zip_city: "12345 Musterstadt",
  student_id: "900123456",
  course_id: "123456",
  assignment_title: "Grundlagen der Informatik",
  b_exam_name: "Thema der B-Aufgabe",
  variant: "XXXXXXXXXXX",
)

// Include your tasks
#include "tasks/task1.typ"
```

### 2. Adding Tasks

You can split your solutions into separate files within the `template/tasks/` directory for better organization. Use the `#task` and `#subtask` functions:

```typst
#import "../../src/lib.typ": task, subtask, source

#task(points: 10, title: "Example Task")[
  Your task description or question goes here.
]

#subtask(title: "a)")[
  Your solution for the subtask.
]
```

### 3. Citing Sources

Use the `#source` function for superscript citations. It supports page numbers and AI documentation:

```typst
// Basic citation
#source("wbh_studienheft")

// Citation with page number
#source("wbh_studienheft", supplement: "S. 12")

// AI Citation (adds a footnote with model and prompt)
#source("gemini", model: "Gemini 1.5 Pro", prompt: "Explain recursion.")
```

Don't forget to add your references to `template/references.bib` and include the bibliography at the end of `main.typ`:

```typst
#pagebreak()
#bibliography("references.bib", style: "apa", title: "Literaturverzeichnis")
```

## Configuration Fields

| Field              | Description                               |
| :----------------- | :---------------------------------------- |
| `last_name`        | Your surname                              |
| `first_name`       | Your given name                           |
| `assignment_code`  | The official code (e.g., B-GND01-XX1-K02) |
| `street`           | Your street and house number              |
| `zip_city`         | Your postal code and city                 |
| `student_id`       | Your WBH Matrikelnummer                   |
| `course_id`        | Your Studiengangsnummer                   |
| `assignment_title` | The main title of the module              |
| `b_exam_name`      | The specific name of the B-Aufgabe        |
| `variant`          | The variant/version of the assignment     |

## Project Structure

- `src/`: Core template logic and components.
  - `lib.typ`: Main entry point for imports.
  - `components/layout.typ`: Page setup, headers, and title block.
  - `components/elements.typ`: Task, subtask, and source definitions.
  - `components/utils.typ`: Colors and constants.
- `template/`: Your workspace.
  - `main.typ`: The main document file.
  - `tasks/`: Directory for individual task files.
  - `references.bib`: Your bibliography file.
- `assets/`: Logos and other media.

## License

This project is licensed under the MIT License - see the LICENSE file for details.