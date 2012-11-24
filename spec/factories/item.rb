FactoryGirl.define do
  factory :item do
    id 1
    name 'A Fake Name' # default values
    picture 'http://www.google.com/images/srpr/logo3w.png'
    description 'Fake description'
    opening_bid 10
    closing_day {6.months.from_now}
    closing_time {6.minutes.from_now}
  end
end