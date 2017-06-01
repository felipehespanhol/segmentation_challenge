FactoryGirl.define do 

  factory :contact do
    name "Felipe Hespanhol"
    email "felipe@totalcommit.com"
    state "Rio de Janeiro"
    age 32

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
