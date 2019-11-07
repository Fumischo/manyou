FactoryBot.define do
  factory :label do
    name { "fumischo" }
  end 

  factory :second_label, class: Label do
    name { "fumischo2" }
  end
end
