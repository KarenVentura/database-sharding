# frozen_string_literal: true

FactoryBot.define do
  factory :database do
    host { 'localhost' }
    name { 'wdt_test' }
  end
end
