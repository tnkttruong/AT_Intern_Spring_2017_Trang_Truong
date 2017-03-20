require "pry"

class Ex3
  def get_sub_array(a1,a2)
    result =[]
    a1.map{|i| 
      no = a2.detect {|j|
        j.include? i
      }
      result.push(i) if no!= nil 
    }
    print "sub array is: ", result.uniq.sort ,"\n"
  end
end

a1 = ["live","ron","arp", "liv", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

a3 = ["tarp", "mice", "bull"]
a4 = ["lively", "alive", "harp", "sharp", "armstrong"]

ex3 = Ex3.new
ex3.get_sub_array(a1,a2)
ex3.get_sub_array(a3,a4)