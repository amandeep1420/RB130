=begin

P
  - define a class Meetup with a constructor taking a month and a year
    and a method #day (weekday, schedule) where weekday is a day of the week
    and schedule is a key string such as first, second, third, fourth, 
    fifth, last, or teenth
  ~
  Classes:
    Meetup
      - methods (class):
        - #new: takes (year, month) and creates an instance of Meetup
      - methods (instance):
        - #day: takes (day_of_week, key_word) and returns exact date of day
                based on keyword using year and month attributes stored in 
                object. returned format should be a Date object...
         - note: possible helper method implementation: Object#send 
         - note: string case should not matter
         - note: key_words are as follows:
          - first: first instance of given day in month
          - second: second instance of given day in month
          - third
          - fourth
          - fifth
          - last: last instance of given day in month
          - teenth: instance of given day in month whose date falls in 13..19
        note: should return nil if day does not exist
  ~
    - note: 'date' class is required
E
  - see book
D
  - arrays for date collection
A
  - create Meetup class
    - create #new(year, day)
      - set @year to year
      - set @day to day
  - create #day method
    - fix keyword string
      - string = string.downcase
      
    - convert weekday to symbol to use with #send
      - weekday = (weekday.downcase + '?').to_sym
      
    - find all date objects that match criteria and collect them => moved to private method
      - initialize variable 'valid dates' to empty array for storage
      - from (1..31)
        - date_object = Date.new(@year, @month, day)
        - push date_object to collection if date_object.send(weekday) == true
      - end
      - rescue Date::Error -> break #each iteration
      
    - find the correct date object => moved to private method
      - case key_word
      - when first then date_collection.first
      - when second
      - when third
      - when fourth
      - when fifth
      - when last
      - when teenth then date_collection.select { |object| (13..19).include?(object.day) }.first
      
      
    
      
      
      
  
C
=end

require 'date'

class Meetup
  def initialize(year, month)
    @year   = year
    @month  = month
  end
  
  def day(weekday, key_word)
    key_word    = key_word.downcase
    weekday     = (weekday.downcase. + '?').to_sym
    valid_dates = find_valid_dates(weekday)
    
    find_desired_day(valid_dates, key_word)
  end
      
  private
    
  def find_valid_dates(weekday_symbol)
    valid_dates = []
    
    (1..31).each do |day|
      begin
        date_object = Date.new(@year, @month, day)
        if date_object.send(weekday_symbol) == true
          valid_dates << date_object
        end
      rescue Date::Error
        break
      end
    end
    
    valid_dates
  end
  
  def find_desired_day(dates, key_word)
    case key_word
    when 'first'  then dates[0]
    when 'second' then dates[1]
    when 'third'  then dates[2]
    when 'fourth' then dates[3]
    when 'fifth'  then dates[4]
    when 'last'   then dates.last
    when 'teenth' then dates.select { |day_object| (13..19).include?(day_object.day) }[0]
    end
  end
end
    

meetup = Meetup.new(2013, 3)

p meetup.day('Monday', 'first') == Date.civil(2013, 3, 4)