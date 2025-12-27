# WBH Typst Template (B-Aufgabe)

Unofficial Typst template for "B-Aufgaben" (assignments) at the Wilhelm Büchner Hochschule (WBH), utilizing WBH colors.

## Usage

### 1. Document Setup

Import the template and configure your details in the `project` function:

```typst
#import "src/lib.typ": project, task, subtask

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
```

### 2. Adding Tasks

Use the `#task` and `#subtask` functions to structure your solutions:

```typst
#task(points: 10, title: "Example Task")[
  Your task description or question goes here.
]

#subtask(title: "a)")[
  Your solution for the subtask.
]
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
  - `components/elements.typ`: Task and subtask definitions.
  - `components/utils.typ`: Colors and constants.
- `template/`: Contains `main.typ` as a starting point for your assignment.
- `assets/`: Logos and other media.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
