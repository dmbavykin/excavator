# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    company_name { FFaker::Company.name }
    address { FFaker::AddressUA.street_name }
    city { FFaker::AddressUA.city }
    state { FFaker::AddressUA.province }
    zip { FFaker::AddressUA.zip_code }
    crew_on_site { true }
    ticket
  end
end
