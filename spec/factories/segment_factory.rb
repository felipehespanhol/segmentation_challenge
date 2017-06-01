FactoryGirl.define do 
  factory :segment do
    name "International Emails" 
    conditions { { email_ends_with: ".com" } }
    operators  { [] }
  end
end
