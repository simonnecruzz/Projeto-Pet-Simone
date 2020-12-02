require_relative '../../supports/models/category_pet.rb'

FactoryBot.define do
    factory :Category, class: Add_pet_category do
            id {"11#{Faker::Number.number(digits: 10)}"}
            name {"#{Faker::Creature::Cat.breed}"}
    end
end