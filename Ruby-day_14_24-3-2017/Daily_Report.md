Daily Report - 24/3/2017


----------
#inheritance

Inheritance is when a class inherits behavior from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.
Example:

```ruby

class A

  def hello
    puts "hello"
  end
end

class B < A

end

B.new.hello

#=> hello

```

#module

A Module is a collection of methods and constants. The methods in a module may be instance methods or module methods. 
Module is used for multiple inheritance

when used include, methods in a module will be instance methods

```ruby

module A

  def hello
    puts "hello"
  end

end

class B
  include A

end

B.new.hello
#=> hello
B.hello
#=> NoMethodError

```

when used extend, methods in a module will be class methods

```ruby

module A

  def hello
    puts "hello"
  end

end

class B
  extend A

end

B.hello
#=> hello
B.new.hello
#=> NoMethodError

```

##multiple inheritance

```ruby

module A

  def inheritance_method_A
    puts "inheritance_method of module A"
  end

end

module A1

  def inheritance_method_A1
    puts "inheritance_method of module A1"
  end

end

class B
  include A,A1

  def inheritance_exp
    inheritance_method_A
    inheritance_method_A1
  end
end

B.new.inheritance_exp

#inheritance_method of module A
#inheritance_method of module A1

```

#Ruby Access Control

Ruby gives three levels of protection:

##Public(this is default)

Public methods can be called by everyone

##Protected

Protected methods only can be called in class, can be called with **self**

##Private

Private methods only can be called in class, can't be called with **self**

Example:

```ruby

class A

  def public_method
    puts "this is public_method"
  end

  def protected_method_self
    self.protected_method
  end

  def private_method_self
    self.private_method
  end

  protected

  def protected_method
    puts "this is protected method"
  end

  private

  def private_method
    puts "this is private_method"
  end
end

class B

  def example_access_control
    A.new.public_method
  end
end

B.new.example_access_control
#=> this is public_method
A.new.public_method
#=> this is public_method
A.new.protected_method
#=> NoMethodError
A.new.private_method
#=> NoMethodError
A.new.protected_method_self
#=>this is protected method
A.new.private_method_self
#=>this is protected method

```

