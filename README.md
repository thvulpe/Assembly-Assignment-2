Assembly-based solutions to low-level computing problems, designed to deepen understanding of memory access, bitwise manipulation, control flow, and performance-oriented logic using x86 instructions.

📄 **Assignment repository:** (https://gitlab.cs.pub.ro/iocla/tema-2-2025)  
👨‍💻 **Author:** Theodor Vulpe – Student @ Faculty of Automatic Control and Computer Science, UPB

---

## ✅ Task Overview

### 🔹 Task 1 – Filter Powers of Two

Store only those values from a source array into a destination array **if they are powers of two**.

- Uses the bitwise identity:  
  `x & (x - 1) == 0 ⟹ x is a power of 2`
- Skips zero explicitly, since `0 & -1 == 0`, but 0 is **not** a power of 2.

---

### 🔹 Task 2 – Event Validator & Sorter

#### 📅 Subtask 1: Validate Date

- Validates year and month using range checks.
- Uses `invalid_date` label for invalid components.
- Looks up the number of days in each month.
- Verifies the day is within the valid range.

#### 🔁 Subtask 2: Sort Events by Name

- Implements a **bubble sort** with two nested loops.
- `ecx` holds the number of events.
- Each event is 36 bytes → swapped in 9 `dword` steps.
- Compares names character by character to determine order.

---

### 🔹 Task 3 – Base64 Encoding

- Calculates the number of 3-byte groups.
- Combines them into 24-bit chunks via left shifts.
- Extracts four 6-bit segments from each chunk using right shifts and masks.
- Maps each segment to its corresponding Base64 character.
- Writes the encoded string to the destination buffer.

---

### 🔹 Task 4 – Sudoku Row & Column Checker

- Iterates over digits `1` to `9` for each row or column.
- For each digit:
  - Checks if it appears **exactly once**.
  - Uses a flag array to track duplicates.
- If a digit is missing or repeated → row/column is invalid.
- `check_row` computes a row pointer once.
- `check_column` calculates each cell address using:  
  `row * cols + col`

