#!/bin/bash

flex minir.l
bison minir.y
g++ minir.tab.c -o parser