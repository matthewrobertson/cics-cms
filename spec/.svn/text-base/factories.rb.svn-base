require 'factory_girl'

FactoryGirl.define do

  factory :user do
    full_name 'Matthew Robertson'
    pref_name 'Matt'
    sequence(:email){|n| "email#{n}@factory.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :announcement do
    topic "Server Status"
		content "Schedule of inactivity for February"
    kind "Warning"
  end

  factory :project do
    started_at  "2012-02-15 00:00:00"
    ending_at  "2012-03-15 00:00:00"
    sequence(:name){|n| "CICS-#{n}" }
    description  "Term project for MSS students based on content management system"
    owner_id  1
  end

  factory :resource do
    user_id 1
    project_id 1
    sequence(:name){|n| "file#{n}.txt" }
    version 1
    description "Test file for project"
    location "./path_to_location"
    mime "text"
    created_at "2012-02-15 12:30:24"
    updated_at "2012-02-16 12:31:50"
  end

end