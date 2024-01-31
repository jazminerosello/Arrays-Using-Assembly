# Arrays-Using-Assembly

**Author**: Ma. Jazmine P. Rosello

**Purpose**: For the completion of exercise in CMSC 131: Introduction to COmputer Organization and Machine Level

## Program Description

Create an Assembly program with a function that finds the largest non-negative number among five
signed numbers in the array named "num_arr". Values of the numbers should be from -32,767 to
+32,767.

If there is no positive number in "num_arr", the memory variable "all_negative" should be set to
1 and the value of the memory variable "largest" should be equal to -1. Otherwise, store the
largest positive number found to the memory variable "largest" and set "all_negative" to 0.

## To run with the use of gdb

file a.out

b*exit_here

r

x/5dh &num_arr

x/db &all_negative

x/dh &largest
