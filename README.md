# Collections

Simple IOS application for different operations with collections. \
Aims at deep understanding of collections and execution times of the same operations with a different approach. Also shows the importance of multithreading for creating user-friendly applications that run smoothly.

## Required functionality
- First screen: operations with array.
Generate an array of integers with 10_000_000 elements from 0 to 9_999_999 and display the execution time.\
Operations to perform:
  - insert at the beginning of an array 1000 elements (from 0 to 999 for example) one-by-one / at once;\
  - insert in the middle of an array 1000 elements one-by-one / at once;\
  - append to the end of an array 1000 elements one-by-one / at once;\
  - remove at the beginning 1000 elements one-by-one / at once;\
  - remove in the middle 1000 elements one-by-one / at once;\
  - remove at the end 1000 elements one-by-one / at once.

  Display the execution time of each operation.\
  Add an activity indicator for each long-running operation.

- Second screen: operations with set.\
Add two text fields for user input and buttons for operations with sets.\
Operations to perform:
  - display all matching characters from text fields.\
  - display all characters that do not match in input fields.\
  - display all unique characters from the first text field that do not match in text fields.

- Third screen: operations with a dictionary.\
Generate an array with 10_000_000 elements of improvised contact structs. String name and String phone.\
Generate a dictionary with 10_000_000 elements of improvised contacts. Name as a key and phone as a value.\
Name format example: “Name\(index)”.\
Operations on both collections:
  - find the first element (“Name0”);\
  - find the last element (“Name9999999”);\
  - search for a non-existing element;

  Display the execution time of each operation.\
  Add an activity indicator for long-running operations.

## Stack
- Swift
- UIKit
- Auto Layout
- Storyboard
- GCD
- Collections
- MVC
- XCTest

## Usage
### First screen
<img src="https://github.com/DmytroHorodyskyi/Collections/blob/main/Screenshots/MainViewController.PNG" width="200" >

### Operations with array.
<img src="https://github.com/DmytroHorodyskyi/Collections/blob/main/Screenshots/ArrayViewController%20(before%20creation)%20.PNG" width="200" >
<img src="https://github.com/DmytroHorodyskyi/Collections/blob/main/Screenshots/ArrayViewController%20(after%20creation)%20.PNG" width="200" >

### Operations with set.
<img src="https://github.com/DmytroHorodyskyi/Collections/blob/main/Screenshots/SetViewController.PNG" width="200" >

### Operations with dictionary.
<img src="https://github.com/DmytroHorodyskyi/Collections/blob/main/Screenshots/DictionaryViewController.PNG" width="200" >

