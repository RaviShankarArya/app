FactoryGirl.define do
  sequence(:email) {|n| "email_person_#{n.to_s.rjust(4, '0')}@yopmail.com" }
  factory :user do |u|
    first_name "Ravi"
    last_name "Shankar"
    u.email
    password "Password123"
    password_confirmation "Password123"
    phone "990-191-6142"
    auth_token "MyString"
  end

end
