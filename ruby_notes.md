# RUBY TIPS


``` print "Hello World" ```     _print a simple string_  
``` puts "Hello World" ```      _print a simple string, but put the next command in a new line_  


``` variable_name = "World" ```         _define a variable_  
``` puts ("Hello" + variable_name) ```  _attach more string or variables_  
``` puts variable_name.upcase() ```     _call a function on a variable_

``` nil ``` _is equal to null_

### methods

``` 
def sayhi


end

```
_define a method_  


``` sayhi ```   
_to run a method_  

``` 
def sayhi(param)
    puts "say #{param}"
end

```
_define a method with a parameter_  


``` sayhi(param) ``` 
_to run a method with paramameter_  

``` 
def sayhi(name="default")
    # code
end

```
_define a method with a default value parameter_    

``` 
if isstate
    # code

else
    # code
end
```

_define if statement_  


``` and ```  ``` or ``` ``` elsif   ```
 
_put another condition_  

``` 
case variable

    when "value of variable"
        # code
    when "another value"
        # code 

    else 
        # code when any conditions is true
end

```
_define case statement_  

``` 
while condition (when condition is true loop run)
    # code [index += 1 for increment of one unit]
end
```

_define while loop_  

```
for item in array 
    # code
end
```

_define for loop_  

``` 
array.each do |item|
    # code
end
``` 
_other mode for define for loop_  

``` 
for index in 10
    # code
end

10.times do |index|
    # code 
end
```
_for loop with number count_  

``` 
# comment
```  

``` 
File.open("path", "r") do |file|
    puts file.read()

    # remember to close the file with file.close()
end
``` 
_read a file_  


``` 
File.open("path", "a") do |file|
    puts file.write("write a string")

    # remember to close the file with file.close()
end
``` 
_read a file_  

### Handlig errors  

```
begin
    # code could make an exception
rescue
    # rescue code
rescue TypeError => error (you can add a rescue with specific error to catch)
    puts error
end
```

### Classes and Objects
```
class Book
    attr_accessor :title, :author, :pages 
end

book1 = Book.new()
book1.title = "Harry Potter"
book1.author = "JK Rowling"
book1.pages = 400
```
_define a class and create an instance of the class_

 ```
class Book
    attr_accessor :title, :author, :pages 

    def initialize(title, author, pages)
        @title = title
        @author =  author
        @pages = pages
    end

    def method
        # code
    end

end

book1 = Book.new("Harry potter", "JK Rowling", 400)
book1.method (call the class method)
```

_define the inizialize and an object method_  

```
class vehicle
    # code
end

class car < vehicle
    # code
end
```
_define the inheritance of the class_  

### Module

``` 
module Tools
    # code
end
```
_define a module_  

```
require_relative "path/tools.rb"
iclude Tools
``` 
_use module_  






