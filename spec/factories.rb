FactoryGirl.define do  
  factory :list do
    name_list "lo que sea"
    est_list false

    factory :invalid_list do
      name_list ""
      est_list true
    end
  end
end