# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    title "MyString"
    location "MyString"
    description "MyText"
    requirements "MyText"
    additional_qualities "MyText"
    salary "MyString"
    instructions "MyText"
    contract_type "MyString"
    notes "MyText"
    expires_at "2012-05-30 09:51:51"

    association :company

    after(:create) { |user| FactoryGirl.create(:company) }
  end

end
