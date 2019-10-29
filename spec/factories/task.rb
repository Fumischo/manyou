# 「FactoryBotを使用します」という記述
FactoryBot.define do

  factory :task do
    name { 'Factoryで作ったデフォルトのタイトル１' }
    description { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { '2019.10.29'}
    status { '未着手' }
  end

  factory :second_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル２' }
    description { 'Factoryで作ったデフォルトのコンテント２' }
    status { '完了' }
    deadline { '2019.10.29'}
  end

  factory :third_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル２' }
    description { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '2019.10.29'}
    status { '完了' }
  end
end

