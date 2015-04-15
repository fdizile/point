FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    sequence(:id) { |n| n }
    sequence(:school_id) { |n| n }
    password "foobar"
    password_confirmation "foobar"


    factory :admin do
    	admin true
    end
  end
  factory :computer do
  	sequence(:acpsnumber) { |n| "025#{n}#{n}#{n}" }
  	sequence(:bpinumber) { |n| "111#{n}#{n}#{n}" }
    sequence(:school_id) { |n| n }
  	make "Dell"
  	computer_model "Optiplex 780"
  	os "Windows 7"
  	category "Lab"
  	sequence(:room) { |n| "01-00#{n}" }
  	sequence(:servicetag) { |n| "JVQS32#{n}" }
  	status "Active"
    association :school
  end
  factory :school do 
    sequence(:id) { |n| n }
    abbreviation "BHS"
    name "Buchholz High School"
    code "0431"
    phone "352-955-6702"
    address "5510 NW 27th Ave. Gainesville, FL 32606"
  end
end