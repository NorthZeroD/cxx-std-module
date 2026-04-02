# CXX-STD-MODULE

This repository shows how to use C++ std modules.

Also see:

- [Using the C++23 std Module with Clang 18 - 0xStubs](https://0xstubs.org/using-the-c23-std-module-with-clang-18/)
- [Using the C++23 std Module with GCC 15 - 0xStubs](https://0xstubs.org/using-the-c23-std-module-with-gcc-15/)

Thanks to 0xStubs' blogs. The most useful articles about using C++ std modules.

## Dependencies

Make sure you have `clang++`, `g++`, `cmake`, `ninja` programs, and `libc++` dynamic libraries.

Make sure `/usr/share/libc++/v1/std.cppm` and `/usr/include/c++/15/bits/std.cc` are exist.

On Fedora, install dependencies with:

```bash
sudo dnf install clang gcc cmake ninja-build libcxx libcxx-devel
```

<details>

<summary>The versions of the tools I used</summary>

```bash
cxx-std-module$ ./scripts/print_versions_of_tools.sh
========== clang++ ==========
clang version 21.1.8 (Fedora 21.1.8-4.fc43)
========== g++ ==========
g++ (GCC) 15.2.1 20260123 (Red Hat 15.2.1-7)
========== cmake ==========
cmake version 3.31.11
========== ninja ==========
1.13.1
```

</details>

## Run

Run the scripts in the `scripts` directory.

## License

[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
