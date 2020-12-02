require_relative '../../supports/models/pet_add.rb'

FactoryBot.define do
    factory :Addpet, class: Add_pet_model do
            id {"12#{Faker::Number.number(digits: 10)}"}
            category {attributes_for(:Category)}
            name {"#{Faker::Name.first_name}"} 
            photoUrls {["https://br-support.files.wordpress.com/2018/07/add-media-pt-br2.png"]}
            tags{[attributes_for(:Tags)]}
            status {"available"}
        end
end