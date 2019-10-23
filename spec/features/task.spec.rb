# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do

  # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
  Task.create!(name: 'test_task_01', description: 'testtesttest')
  Task.create!(name: 'test_task_02', description: 'samplesample')


  # tasks_pathにvisitする（タスク一覧ページに遷移する）
  visit tasks_path

  # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
  # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
  expect(page).to have_content 'testtesttest'
  expect(page).to have_content 'samplesample'

  end

  scenario "タスク作成のテスト" do

  visit new_task_path

  fill_in 'task_name', with: 'test_task_01'
  fill_in 'task_description', with: 'test_task_02'
  
  click_on 'Create Task'

  expect(page).to have_content 'test_task_01'
  expect(page).to have_content 'test_task_02'

  end

  scenario "タスク詳細のテスト" do

    @task = Task.create(name:'ttt', description: 'ttt')

    visit task_path(@task.id)


  expect(page).to have_content 'ttt'

  end
end