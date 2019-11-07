FactoryBot.define do
  factory :user, class: User do
    # id { 2 }
    name { "fumi" }
    email { "hoge@example.com" }
    password { "damnit" }
    password_confirmation { "damnit" }
    # admin { false }
  end

  factory :second_user, class: User do
    # id { 3 }
    name { "fumi2" }
    email { "hoge2@example.com" }
    password { "damnshit" }
    password_confirmation { "damnshit" }
    # admin { true }
  end

  factory :third_user, class: User do
    name { "fumi3" }
    email { "hoge3@example.com" }
    password { "damnheck" }
    password_confirmation { "damnheck" }
  end

  factory :label_user, class: User do
    name { "ユーザーf" }
    email { "f@example.com"}
    password { "damnfuck"}
    password_confirmation {"damnfuck"}
  end

  factory :second_label_user, class: User do
    name { "ユーザーg" }
    email { "g@example.com" }
    password { "damnwell" }
    password_confirmation { "damnwell" }
  end
end


