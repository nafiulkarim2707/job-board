FactoryGirl.define do
  sequence(:name) { |n| "company #{n * Time.now.to_i}" }
  sequence(:email) {|n| "somebody_#{n * Time.now.to_i}@example.com" }
  sequence(:website) { |n| "http://#{n * Time.now.to_i}.hola.com" }
end