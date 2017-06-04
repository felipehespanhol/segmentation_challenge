# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  age        :integer
#  state      :string
#  job        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do 

  factory :contact do
    sequence(:name)  { |n| "Felipe Hespanhol #{n}" }
    sequence(:email) { |n| "felipe#{n}@totalcommit.com" }
    state "Rio de Janeiro"
    age { rand(15..70) }
    sequence(:job) { |n| "Profession #{n}" }

    factory :international_contact
    factory :brazilian_contact do
      name "Reinaldo"
      email "reinaldo@email.com.br"
      age 18
    end
    factory :italian_contact do
      name "Andrea Piccolo"
      email "andrea@email.com.it"
      age 43
    end
  end

end
