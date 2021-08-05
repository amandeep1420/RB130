=begin

P
  - create a clock that is independent of date
  ~
  Classes:
    Clock
      - methods:
        - instance
          - initialize: creates a clock object with a given hour and minute
                          - should account for 24 hours
                          - first parameter for hour, optional second parameter
                            for minute (default is 00)
          - to_s: returns a string representation of the time in XX:XX format
          - minus: subtracts given integer as minutes from clock time
          - plus: adds given integer as minutes to clock time
        - class
          - at: calls the initialize method
  ~
    - note: should account for midnight wraparound
    - note: ...this is tricky
E
  - see book
D
  - array?
A
  - create Clock class
    - create #initialize method
      - @hour = hour
      - @minute = minute (optional: default is 00)
      
    - create ::at method
      - calls initialize with given args
      
    - create #to_s method
      - hour = if @hour is less than 10
                  "0" + @hour
                else
                  @hour to string
      - minute = if @minute is less than 10
                   "0" + @hour
                 else
                   @hour to string
      - return hour + minute
    
    - create plus and minus method that takes minutes as arg
      - create helper method to convert minutes to hours and minutes
        - possible method: #divmod
          - hours, minutes = minutes.divmod(60)
          - return [hours, minutes]
      
      - plus method
        - @minutes = @minutes + minutes
        - if @minutes > 59
          - until @minutes < 60
            - @minutes = @minutes - 60
            - hours + 1
        - @hours = @hours + hours
        - if @hours > 23
          - until @hours < 24
              - @hours = @hours - 24
        
    
C
=end

require 'pry'

class Clock
  attr_reader :hour, :minute
  
  def initialize(hour, minute=0)
    @hour = hour
    @minute = minute
  end
  
  def self.at(hour, minute=0)
    self.new(hour, minute)
  end
  
  def to_s
    hour = (@hour < 10 ? "0#{@hour}" : @hour.to_s)
    minute = (@minute < 10 ? "0#{@minute}" : @minute.to_s)
    "#{hour}:#{minute}"
  end
  
  def +(integer)
    hours, minutes = convert_to_hours_and_minutes_array(integer)
    
    @minute += minutes
    
    if @minute > 59
        until @minute < 60
          hours += 1
          @minute -= 60
        end
    end
    
    @hour += hours
    
    if @hour > 23
      until @hour < 24
        @hour -= 24
      end
    end
    
    self
  end

  def -(integer)
    hours, minutes = convert_to_hours_and_minutes_array(integer)
    
    @minute -= minutes
    
    if @minute < 0
      until @minute >= 0
        hours += 1
        @minute += 60
      end
    end
    
    @hour -= hours
    
    if @hour < 0
      loop do
        actual_time = 24
        difference = @hour + 24
        @hour += 24
        actual_time -= difference
        break if actual_time >= 0 && @hour.positive?
        actual_time = 24
      end
    end
    
    self
  end
  
  def convert_to_hours_and_minutes_array(minutes)
    minutes.divmod(60)
  end
  
  def ==(other_clock)
    self.hour == other_clock.hour &&
      self.minute == other_clock.minute
  end
end


=begin

execution starts on line 10 with method invocation

execution then moves to the method implementation on line 2, 
where the local variable number is initialized to the value of the 
argument passed into invocation

execution moves to the conditional on line 3, invoking the block_given?
method (which returns true)

execution then moves to line 4, which yields the return value of calling the 
+ method on `number` and passing 1 in as an arg - 6

execution then returns to line 10, where the block local variable
num is initialized to 6

execution then moves to line 11, where the puts method is inokved and 
num is passed in as an arg outputting a string rep of num and returingn
nil

execution then moves to line 12, the end of the block

execution then returns to the method implementation, where line 4 was previously
executed

execution moves to line 5, the end of the conditional

line 6, calls number + 1, returns 6 to...

...back to line 10, where the method was originally invoked - nothing is 
done with the returned value from the method call

