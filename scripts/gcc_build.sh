#!/usr/bin/bash

g++ -std=c++23 -fmodules -fsearch-include-path -c bits/std.cc

g++ -std=c++23 -fmodules -o main main.cpp
