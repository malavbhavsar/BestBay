FactoryGirl.define do
  factory :item do
    name 'A Fake Name' # default values
    picture 'http://www.google.com/images/srpr/logo3w.png'
    description 'Fake description'
    opening_bid 10
    highest_bid 20
  end
end