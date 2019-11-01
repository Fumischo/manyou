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
    task = Task.new(name:'テスト', description:'テストテスト', deadline: '2019.10.30')
    expect(task).to be_valid
  end

  it "deadlineが空ならバリデーションが通らない" do
    task = Task.new(name: 'testtest1', description: 'testtest1', deadline: '')
    expect(task).not_to be_valid
  end

  it "name、description、status、deadline、priorityバリデーションが通る" do
    task = Task.new(name: 'testtest1', description: 'testtest1', deadline: '2019.10.30', status: 0, priority: 1)
    expect(task).to be_valid
  end

  before do
    @task = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:second_task)
    @task3 = FactoryBot.create(:third_task)
  end
  
  context "modelにscopeによる絞りこみ検索の確認" do
    it "nameとstatusのand検索のscopeメソッドの確認" do
      val = { 
        name: @task.name,
        status: Task.statuses[@task.status]
      }
      expect(Task.search_name_and_status(val).first.id).to eq(@task.id)
    end
  end

    it "nameとstatusのscopeメソッドによるnameのみの検索できるかの確認" do
      val = { 
        name: @task.name
      }
      expect(Task.search_name(val).first.id).to eq(@task.id)
    end
    it "nameとstatusのscopeメソッドによるstatusのみの検索できるかの確認" do
      val = {
        status: Task.statuses[@task.status]
      }
      expect(Task.search_status(val).first.id).to eq(@task.id)
    end
end



# end

