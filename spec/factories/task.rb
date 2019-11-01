FactoryBot.define do
  factory :task do
    name { 'Factoryで作ったデフォルトのタイトル1' }
    description { 'Factoryで作ったデフォルトのコンテント1' }
    deadline { DateTime.now + 5}
    status { 0 }
    priority { 2 }
  end

  factory :second_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル2' }
    description { 'Factoryで作ったデフォルトのコンテント2' }
    deadline { DateTime.now + 10 }
    status { 0 }
    priority { 1 }
  end

  factory :third_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル3' }
    description { 'Factoryで作ったデフォルトのタイトル3' }
    deadline { DateTime.now + 10 }
    status { 1}
    priority { 2 }
  end
end