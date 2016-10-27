
MONTH_WITH_31_DAYS_HASH = { leap: 31, normal: 31 }.freeze
MONTH_WITH_30_DAYS_HASH = { leap: 30, normal: 30 }.freeze
FEBRUARY_HASH = { leap: 29, normal: 28 }.freeze

MONTHS = {
  january: MONTH_WITH_31_DAYS_HASH,
  february: FEBRUARY_HASH,
  march: MONTH_WITH_31_DAYS_HASH,
  april: MONTH_WITH_30_DAYS_HASH,
  may: MONTH_WITH_31_DAYS_HASH,
  june: MONTH_WITH_30_DAYS_HASH,
  july: MONTH_WITH_31_DAYS_HASH,
  august: MONTH_WITH_31_DAYS_HASH,
  september: MONTH_WITH_30_DAYS_HASH,
  october: MONTH_WITH_31_DAYS_HASH,
  november: MONTH_WITH_30_DAYS_HASH,
  december: MONTH_WITH_31_DAYS_HASH
}.freeze

DAYS_OF_THE_WEEK = {
  (MONDAY    = 0) => :MONDAY,
  (TUESDAY   = 1) => :TUESDAY,
  (WEDNESDAY = 2) => :WEDNESDAY,
  (THURSDAY  = 3) => :THURSDAY,
  (FRIDAY    = 4) => :FRIDAY,
  (SATURDAY  = 5) => :SATURDAY,
  (SUNDAY    = 6) => :SUNDAY
}.freeze

NEXT_DAY_OF_THE_WEEK = {
  MONDAY    => TUESDAY,
  TUESDAY   => WEDNESDAY,
  WEDNESDAY => THURSDAY,
  THURSDAY  => FRIDAY,
  FRIDAY    => SATURDAY,
  SATURDAY  => SUNDAY,
  SUNDAY    => MONDAY
}.freeze

fail unless 365 == MONTHS.map { |_, month_hash| month_hash[:normal] }.reduce(:+)
fail unless 366 == MONTHS.map { |_, month_hash| month_hash[:leap] }.reduce(:+)

first_day_of_month = nil # Computed
last_day_of_month = SUNDAY
first_of_the_month_sunday_count = 0
(1900..2000).each do |year|
  MONTHS.each do |month_key, month_hash|
    leap_year = if (year % 100).zero?
                  (year % 400).zero?
                else
                  (year % 4).zero?
                end
    month_days = leap_year ? month_hash[:leap] : month_hash[:normal]
    first_day_of_month = NEXT_DAY_OF_THE_WEEK[last_day_of_month]
    puts "#{DAYS_OF_THE_WEEK[first_day_of_month]}: #{month_key} 1, #{year}#{' (leap year)' if leap_year}"

    remainder_days = (month_days - 1) % 7
    last_day_of_month = first_day_of_month
    remainder_days.times do
      last_day_of_month = NEXT_DAY_OF_THE_WEEK[last_day_of_month]
    end

    if year > 1900 && first_day_of_month == SUNDAY
      first_of_the_month_sunday_count = first_of_the_month_sunday_count + 1
    end
  end
end

puts first_of_the_month_sunday_count

=begin
C:\ProjectEulerSolutions>ruby 019.rb
...
SATURDAY: april 1, 2000 (leap year)
MONDAY: may 1, 2000 (leap year)
THURSDAY: june 1, 2000 (leap year)
SATURDAY: july 1, 2000 (leap year)
TUESDAY: august 1, 2000 (leap year)
FRIDAY: september 1, 2000 (leap year)
SUNDAY: october 1, 2000 (leap year)
WEDNESDAY: november 1, 2000 (leap year)
FRIDAY: december 1, 2000 (leap year)
171

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end
