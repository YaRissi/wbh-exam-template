# WBH Exam Template

A Typst template for creating WBH exam submissions (B-Aufgaben).

## Usage

### Local Usage
1. Clone this repository.
2. Copy the `template` directory content to your new project folder or work directly in `template/main.typ`.
3. Ensure the import in your `main.typ` points to `src/lib.typ` correctly if you are keeping this structure, or install the package locally.

### Features
- **Header/Footer**: Automatically formatted with student info and page numbers.
- **Tasks**: `#task(points: 10)[...]` block for clear separation.
- **Questions**: `#question[...]` helper.
- **Choices**: `#choice(("Option A", "Option B"))` for MCQs.
- **Answer Spaces**: `#answer-lines(count: 5)` and `#answer-box(height: 5cm)`.

## Configuration
Update the `project` function arguments in `main.typ`:

```typst
#show: project.with(
  title: "B-Aufgabe 1",
  course: "CS101",
  student_name: "Your Name",
  // ...
)
```
