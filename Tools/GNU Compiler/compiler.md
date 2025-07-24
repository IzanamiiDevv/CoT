# GNU Compiler Syntax

Here’s a list of some commonly used `gcc` and `g++` flags, organized by category:

---

## **General Flags**

### 🛠️ **Basic Compilation Flags**

| Flag           | Description |
|----------------|-------------|
| `-c`           | Compile without linking (produces an object file). |
| `-o <file>`    | Specify the output file name. |
| `-I <dir>`     | Add directory to the list of directories searched for include files. |
| `-L <dir>`     | Add directory to the list of directories searched for libraries. |
| `-l<name>`     | Link with library `lib<name>.so` or `lib<name>.a`. |

---

### 📘 **Informational and Utility Flags**

| Flag           | Description |
|----------------|-------------|
| `-v`           | Verbose output showing the compilation steps. |
| `--version`    | Show the version of the compiler. |
| `--help`       | Show help for `gcc` or `g++` with available options and flags. |
| `-pipe`        | Use pipes rather than temporary files for communication between processes. |

---

### 💠 C++ Specific Flags

| Flag                    | Description |
|-------------------------|-------------|
| `-fno-exceptions`       | Disable C++ exception handling. |
| `-fno-rtti`             | Disable C++ runtime type information (RTTI). |
| `-fno-threadsafe-statics` | Disable thread-safe statics initialization. |

---

### 🧾 Preprocessor Flags

| Flag        | Description |
|-------------|-------------|
| `-D<macro>` | Define a macro (e.g., `-DDEBUG=1`). |
| `-U<macro>` | Undefine a macro. |
| `-E`        | Only run the preprocessor and output the result. |

---

## **Development Flags**

### 🐞 Debugging Flags

| Flag     | Description |
|----------|-------------|
| `-g`     | Generate debugging information. |
| `-g3`    | Includes even more debugging information. |
| `-ggdb`  | Generates debugging information specifically for use with GDB. |

---

### ⚠️ Warning and Error Flags

| Flag               | Description                                                                                |
| ------------------ | ------------------------------------------------------------------------------------------ |
| `-Wall`            | Enable commonly used warnings.                                                             |
| `-Wextra`          | Enable additional warnings beyond `-Wall`.                                                 |
| `-Werror`          | Treat warnings as errors.                                                                  |
| `-Wpedantic`       | Enforce strict ISO C and ISO C++ standards.                                                |
| `-Wshadow`         | Warn when a variable shadows another.                                                      |
| `-Wconversion`     | Warn about implicit type conversions that may lose information.                            |
| `-fmax-errors=<n>` | Stop compilation after `<n>` errors. Useful to avoid overwhelming output when fixing code. |

---

### 📊 Profiling Flags

| Flag                          | Description |
|-------------------------------|-------------|
| `-pg`                         | Enable profiling with `gprof`. |
| `-fprofile-arcs`, `-ftest-coverage` | Generate code for test coverage analysis with `gcov`. |

---


## **Optimization Flags**

### 🔧 **Main Optimization Levels**

These are the primary optimization flags used during compilation:

| Flag          | Description                                                                                          |
| ------------- | ---------------------------------------------------------------------------------------------------- |
| `-O0`         | No optimization (default). Fastest compilation time, useful for debugging.                           |
| `-O1` or `-O` | Optimize minimally. Some optimizations that don't slow down compile time.                            |
| `-O2`         | Standard optimization. Improves performance without increasing binary size significantly.            |
| `-O3`         | Maximum performance optimizations, even if it increases binary size.                                 |
| `-Os`         | Optimize for size. Similar to `-O2` but avoids code growth.                                          |
| `-Ofast`      | Aggressive optimizations including unsafe math (`-ffast-math`). Ignores strict standards compliance. |
| `-Og`         | Optimized for debugging. Better than `-O0` in some debug scenarios.                                  |

---

### 🧠 **Fine-grained Optimization Flags**

These flags provide more control and can be combined with `-O` levels:

| Flag                                                      | Description                                                       |
| --------------------------------------------------------- | ----------------------------------------------------------------- |
| `-finline-functions`                                      | Enable function inlining. Enabled with `-O3`.                     |
| `-fno-inline`                                             | Disable all inlining.                                             |
| `-funroll-loops`                                          | Unroll loops for speed. Used with `-O3`.                          |
| `-fno-unroll-loops`                                       | Disable loop unrolling.                                           |
| `-fmerge-all-constants`                                   | Merge duplicate constants.                                        |
| `-fstrict-aliasing`                                       | Enables strict aliasing rules (default with `-O2`, `-O3`).        |
| `-fno-strict-aliasing`                                    | Disables strict aliasing (safer with complex pointer code).       |
| `-fomit-frame-pointer`                                    | Omit the frame pointer for performance.                           |
| `-fno-omit-frame-pointer`                                 | Keep frame pointer (useful for debugging).                        |
| `-ffast-math`                                             | Enables unsafe math optimizations.                                |
| `-funsafe-math-optimizations`                             | Part of `-ffast-math`.                                            |
| `-fno-math-errno`                                         | Don’t set `errno` after math functions, faster.                   |
| `-fno-trapping-math`                                      | Assume math won’t trap (faster but unsafe).                       |
| `-flto`                                                   | Link-time optimization (LTO). Optimizes across translation units. |
| `-fipa-pta`                                               | Interprocedural points-to analysis, enabled with `-O2`.           |
| `-floop-interchange`, `-floop-strip-mine`, `-floop-block` | Loop transformation options.                                      |

---

### 💡 **Debug & Diagnostic Related**

| Flag                | Description                                                  |
| ------------------- | ------------------------------------------------------------ |
| `-g`                | Generate debug info. Works with `-Og` and other levels.      |
| `-fstack-usage`     | Emits stack usage info per function.                         |
| `-fopt-info`        | Shows optimization report.                                   |
| `-fopt-info-<pass>` | Show specific optimization pass info, e.g. `-fopt-info-loop` |

---

### 🗜️ **Size Optimization**

| Flag  | Description                                                                       |
| ----- | --------------------------------------------------------------------------------- |
| `-Os` | Optimize for size (instead of speed).                                             |
| `-Oz` | (GCC ≥ 12) Optimize even more for size than `-Os`. May remove some functionality. |

---

### 🔒 **Security / Reliability**

| Flag                       | Description                                                      |
| -------------------------- | ---------------------------------------------------------------- |
| `-fstack-protector`        | Adds stack protection (lightweight).                             |
| `-fstack-protector-strong` | More coverage, protects more functions.                          |
| `-fstack-protector-all`    | Maximum stack protection (may reduce performance).               |
| `-D_FORTIFY_SOURCE=2`      | Adds bounds checking where applicable (default on some distros). |

---

### 📦 **Combined for Best Use**

Typical combos:

* **Development & Debugging**:

  ```bash
  -Og -g -fno-omit-frame-pointer
  ```

* **Performance Release Build**:

  ```bash
  -O2 -march=native -flto -fomit-frame-pointer
  ```

* **Small Size Binary**:

  ```bash
  -Os -flto -s
  ```

* **Maximum Performance (Unsafe)**:

  ```bash
  -Ofast -march=native -flto -funroll-loops
  ```

---

## **Build Options**

### ⚙️ Code Generation Flags

| Flag                   | Description |
|------------------------|-------------|
| `-fPIC`                | Generate position-independent code (used for shared libraries). |
| `-fPIE`                | Generate position-independent executable. |
| `-fstack-protector`    | Enable stack protection. |
| `-march=<cpu>`         | Generate code optimized for a specific CPU (e.g., `-march=native`). |
| `-mtune=<cpu>`         | Optimize for a specific CPU without restricting code to that CPU. |

---

### 🔗 Linking Flags

| Flag                                      | Description |
|-------------------------------------------|-------------|
| `-shared`                                 | Create a shared library. |
| `-static`                                 | Link libraries statically. |
| `-static-libgcc`, `-static-libstdc++`     | Statically link `libgcc` and `libstdc++`. |
| `-rdynamic`                               | Add symbols to the dynamic symbol table (useful for debugging). |
| `-Wl,<options>`                           | Pass options to the linker. |

* **Example of Compiling a DLL**:

  ```bash
  -shared -o error.dll mylib.cpp -Wl,--out-implib,libmylib.a
  ```

* **Static Linking (C)**

  ```bash
  -shared -o error.dll mylib.cpp -Wl,--out-implib,libmylib.a
  ```

* **Static Linking (C)**

  ```bash
  gcc -o main.exe main.c -static -static-libgcc
  ```

* **Static Linking (C++)**

  ```bash
  g++ -o main.exe main.cpp -static -static-libgcc -static-libstdc++
  ```



---

### 📝 Language and Standard Flags

| Flag               | Description |
|--------------------|-------------|
| `-std=<standard>`  | Specify the language standard (e.g., `-std=c99`, `-std=c11`, `-std=c++11`, `-std=c++17`, `-std=c++20`). |
| `-ansi`            | Equivalent to `-std=c89` or `-std=c++98`. |
| `-fpermissive`     | Allows some non-standard code to compile. |

---

