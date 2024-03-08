## String Calculator

#### Problem Statement:
> Create a simple String calculator with a method signature similar to this:
```ruby
def add(str)
```
**Input:** A string of comma-separated numbers. <br />
**Output:** An integer, sum of the numbers.

##### Examples:
```
Input: "", "1", "1,5"
Output: 0, 1, 6
```
##### Method Signature:
```
def add(str)
```
___
#### Technologies Used:

* Ruby programming language
* RSpec (unit test framework for Ruby)

___
#### Implementation Details:

Utilized the add method to perform addition of all the numbers present in the string.
Handled cases for multi-length and multiple delimiters.
Leveraged concepts like string interpolation, string slicing, Ruby enumerators, and error handling.
___
#### Testing:

Considered all the test cases including those present in the full version of TDD Kafka 1.
Written a total of 16 unit test cases, covering all edge cases.
All test cases are successfully satisfied.

___
#### File Explanations:

calculator.rb: Main source code file containing the Calculator class with the add method, the main method that should be called by passing a string to get the output.<br />
calculator_spec.rb: RSpec file containing all unit test cases.

___
#### How to Run:

Run RSpecs:
```bash
rspec ./spec/calculator_spec.rb
```

Run the run.rb file for checking the output:
```bash
ruby ./app/run.rb
```
(Both commands should be run from the main TDD folder)

GitHub Repository:
A GitHub repository named TDD has been created, containing all the required files. It includes app and spec folders which have source code and unit testing code, respectively.

Screenshot for the Passed Test Cases : <br />
![image](https://github.com/abhs18/tdd/assets/56027966/d3bbdd09-f26a-4809-aa08-dad24c4f17d8)

Screenshot after the code run :  <br />
![image](https://github.com/abhs18/tdd/assets/56027966/4d943fea-ccfd-407e-970b-d03298c7e695)
