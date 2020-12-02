require_relative '../../supports/models/tags_pet.rb'

FactoryBot.define do
    factory :Tags, class: Add_pet_tags do
            id {"13#{Faker::Number.number(digits: 10)}"}
            name {"Si_#{Faker::Name.first_name}"} 
        end
end