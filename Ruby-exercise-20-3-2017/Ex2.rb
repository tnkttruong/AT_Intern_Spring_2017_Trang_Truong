require "pry"

class Ex2

  def input_time
    puts "Input time"
    return gets.chomp
  end

  def check_time(time)
    return (time.match /^[0-9]{1,2}\:[0-9]{1,2}\:[0-9]{1,2}$/ ) ? true : false
  end

  def handing_time(time)
    if time == nil || time.to_s.empty?
      puts "time is null or empty!"
      return time
    elsif !check_time(time)
      puts "time is incorrect format 'hh:mm:ss' "
      return nil
    else
      arr_time = time.split(':')
      arr_time.map! { |i| i.to_i}
      if arr_time[2] > 59
        arr_time[2] -=60
        arr_time[1]+=1
      end
      if arr_time[1] > 59
        arr_time[1] -= 60
        arr_time[0] += 1
      end
      while arr_time[0] > 23 do
        arr_time[0] -= 24
      end
      arr_time.map!{|i| i.to_s.rjust(2,'0')}
      puts "The time correct is: #{arr_time[0]}:#{arr_time[1]}:#{arr_time[2]}"
    end
  end
end

ex2 = Ex2.new
time = ex2.input_time
ex2.handing_time(time)

