Daily Report-14/3/2017
#Ruby
##Control Flow
### if-else
- if
Syntax:
if condition
statement
end
> i = 0
> if i == 0
>  puts "i = 0"
>  end
>  
> May be rewrite:
> puts "i = 0" if i == 0

- if-else
Syntax:
if condition
statement
else
statement
end
> i = gets.chomp_to_i
> if i == 0
> puts "i = 0"
> else
> puts "i != 0"
> end
> 
> May be rewrite:
> puts i==0 ? "i == 0" : "i != 0"

- If-elsif
Syntax:
if condition
statement
elsif condition
statement
else
statement
end
>i = gets.chomp.to_i
>if i <1
>puts "i < 1"
>elsif i >3 
>puts "i > 3"
>else
>puts "1<i<3"
##Loop
- While
Syntax:
While condition do
statement
end
> i = 0
> while i < 5 do
> puts i
> i+=1
> end

- Until 
Syntax:
Until condition do
statement
end
> i = 0
> Until i > 5
> puts i
> i+=1
> end

- For
> for i in 1..5
> print "#{i} "
> end

Output:
> 1 2 3 4 5

Another
> for i in 1...5 
> print "#{i} "
> end

Output:
> 1 2 3 4
##Case
case variable
when value1
statement
when value2
statement
else
statement
##Variable
- Local variable
- Global Variable
- Instance Variable
- Class Variable
- Constants Variable
##Method
- Object method
- Class method
