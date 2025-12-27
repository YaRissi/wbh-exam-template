# WBH Typst Template (B-Aufgabe)

Unofficial Typst template for "B-Aufgaben" (assignments) at the Wilhelm Büchner Hochschule (WBH), utilizing WBH colors.

## Local Installation

This template is not yet published to the official Typst Universe. You can install it locally to use it as a package.

### Prerequisites

- [Python 3.9+](https://www.python.org/)

### Installation Steps

1. Clone this repository:
   ```bash
   git clone https://gitlab.com/your-username/wbh-typst-template.git
   cd wbh-typst-template
   ```
2. Run the installation script:
   ```bash
   python scripts/install.py
   ```
   This script will copy the template to your local Typst package directory and update the internal paths.

3. You can now initialize a new project from this template:
   ```bash
   typst init @local/wbh-exam-template:0.2.1 my-assignment
   ```

## Usage

### 1. Document Setup

If you have installed the package locally, import it using the `@local` syntax in your `main.typ`:

```typst
#import "@local/wbh-exam-template:0.2.1": project

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

You can split your solutions into separate files within the `tasks/` directory. Each task file should import the required functions from the package:

```typst
#import "@local/wbh-exam-template:0.2.1": task, subtask, source

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

Don't forget to add your references to `references.bib` and include the bibliography at the end of `main.typ`:

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
- `template/`: The starting point for your assignment (copied when using `typst init`).
  - `main.typ`: The main document file.
  - `tasks/`: Directory for individual task files.
  - `references.bib`: Your bibliography file.
- `assets/`: Logos and other media.
- `scripts/`: Utility scripts (e.g., for local installation).

## License

This project is licensed under the MIT License - see the LICENSE file for details.
