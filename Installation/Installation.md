## 🔧 Installation Guide for C/C++ Development Environment

To get started with C/C++ development on Windows, we'll install the following tools:

1. **MSYS2** – A minimal Unix environment for Windows with easy package management.
2. **GCC** – The GNU Compiler Collection.
3. **GDB** – GNU Debugger.
4. **Premake** – A project build configuration tool.
5. **Visual Studio** – A robust IDE for C/C++ development (used as an optional GUI-based environment).

---

### ✅ 1. Installing MSYS2

MSYS2 provides a Unix-like terminal and package manager (`pacman`) for Windows. It simplifies installing tools like `gcc`, `gdb`, and libraries.

**Steps:**

1. Visit the official MSYS2 website:
   👉 [https://www.msys2.org](https://www.msys2.org)

2. Download the installer suitable for your system (usually `x86_64` for 64-bit).

3. Run the installer and follow the setup instructions:

   * Install it to `C:\msys64` (default).
   * After installation, **launch the MSYS2 terminal** (`MSYS2 MSYS`).

4. **Update the system packages**:

   ```bash
   pacman -Syu
   ```

5. If the terminal closes after the update, reopen it and run:

   ```bash
   pacman -Su
   ```

---

### ✅ 2. Installing GCC (GNU Compiler Collection)

**In the MSYS2 terminal (MINGW64):**

1. Open **MSYS2 MINGW64** from your Start Menu.

2. Install GCC:

   ```bash
   pacman -S mingw-w64-x86_64-gcc
   ```

3. Verify installation:

   ```bash
   gcc --version
   ```

   ✅ Output should display the installed GCC version.

---

### ✅ 3. Installing GDB (GNU Debugger)

**In the same MSYS2 MINGW64 terminal:**

```bash
pacman -S mingw-w64-x86_64-gdb
```

* Verify it:

  ```bash
  gdb --version
  ```

---

### ✅ 4. Installing Premake

Premake is used to generate project files (e.g., for Visual Studio, Makefiles, etc.).

#### Option 1: Using Prebuilt Binaries

1. Go to the official Premake releases page:
   👉 [https://premake.github.io/download.html](https://premake.github.io/download.html)

2. Download the latest Windows zip file.

3. Extract the contents to a directory like `C:\Premake`.

4. Add `C:\Premake` to your **System Environment Variables**:

   * Open Start, search **Environment Variables**
   * Edit `Path`, and add:

     ```
     C:\Premake
     ```

5. Verify:

   ```bash
   premake5 --version
   ```

#### Option 2: Build from Source (Advanced)

If you want the latest version or custom build:

```bash
pacman -S git
git clone --recursive https://github.com/premake/premake-core.git
cd premake-core
make -f Bootstrap.mak windows
```

---

### ✅ 5. Installing Visual Studio (Optional but Preferred for GUI Development)

Visual Studio provides a full-featured IDE with C/C++ project support.

1. Download Visual Studio Installer:
   👉 [https://visualstudio.microsoft.com/downloads/](https://visualstudio.microsoft.com/downloads/)

2. Select **Visual Studio Community Edition** (free).

3. During installation:

   * Select **"Desktop development with C++"** workload.
   * Ensure **MSVC (Microsoft C++ compiler)** and **CMake** are selected.

4. Wait for the installation to complete and launch Visual Studio.

---

### 🔍 Verifying Everything

To check if all tools are installed correctly:

* In **MSYS2 MINGW64**:

  ```bash
  gcc --version
  g++ --version
  gdb --version
  premake5 --version
  ```

* In **Windows Command Prompt**:

  ```cmd
  premake5 --help
  ```

* Open Visual Studio and create a new **C++ Console App** to test.

---

### 🚀 You're Ready!

You now have a full development setup for C/C++ on Windows. You can:

* Compile using `gcc/g++`
* Debug using `gdb`
* Manage projects using `Premake`
* Build or debug with **Visual Studio** as a full IDEs