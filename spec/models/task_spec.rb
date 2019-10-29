require 'rails_helper'

RSpec.describe Task, type: :model do

  it "nameが空ならバリデーションが通らない" do
    task = Task.new(name: '', description: '失敗テスト')
    
    expect(task).not_to be_valid
  end

  it "descriptionが空ならバリデーションが通らない" do
    task = Task.new(name:'失敗テスト', description: '')
    expect(task).not_to be_valid
  end

  it "nameとdescriptionに内容が記載されていればバリデーションが通る" do
    task = Task.new(name:'テスト', description:'テストテスト')
    expect(task).to be_valid
  end

  it "タスクモデルに作成したscopeを使用して検索できるかのテスト" do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
    FactoryBot.create(:task, status: "未着手")
    FactoryBot.create(:second_task, status: "未着手")
    expect_task = FactoryBot.create(:third_task, status: "未着手")
    result = Task.search(task: {name: "タイトル３", status: "未着手"})
    expect(result[0].id).to be expect_task.id
    expect(result.size).to eq 1
    save_and_open_page
  end
end
