FactoryGirl.define do

  factory :item2, class: Item do
    user
    id 1
    name 'A Fake Name' # default values
    picture 'http://www.google.com/images/srpr/logo3w.png'
    description 'Fake description'
    opening_bid 10
    closing_date {6.months.from_now}
  end

  factory :item do
    id 1
    name 'A Fake Name' # default values
    picture 'http://www.google.com/images/srpr/logo3w.png'
    description 'Fake description'
    opening_bid 10
    closing_date {6.months.from_now}
  end
end