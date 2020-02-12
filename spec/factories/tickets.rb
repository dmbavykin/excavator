# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    request_number { FFaker::Product.model }
    sequence_number { rand(1000..3000) }
    request_type { Ticket.request_types.values.sample }
    response_due_date_time { Time.zone.now }
    primary_sa_code { FFaker::AddressUK.postcode }
    additional_sa_codes { Array.new(3) { FFaker::AddressUK.postcode } }
    well_known_text { 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))' }

    trait :with_excavator do
      excavator
    end
  end
end
