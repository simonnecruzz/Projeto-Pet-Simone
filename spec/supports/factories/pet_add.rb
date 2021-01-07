require_relative "../../supports/models/pet_add.rb"

FactoryBot.define do
  factory :Addpet, class: Add_pet_model do
    id { "12#{Faker::Number.number(digits: 10)}" }
    category { attributes_for(:Category) }
    name { "#{Faker::Name.first_name}" }
    photoUrls { ["https://br-support.files.wordpress.com/2018/07/add-media-pt-br2.png"] }
    tags { [attributes_for(:Tags)] }
    status { "available" }

    trait :status_sold do
      status { "sold" }
    end

    trait :status_pending do
      status { "pending" }
    end

    factory :attr_status_sold, traits: [:status_sold]
    factory :attr_status_pending, traits: [:status_pending]
  end
end
