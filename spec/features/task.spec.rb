# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task, description: " 詳細変更")
    FactoryBot.create(:second_task, name: "タイトル名変更")
    
  end

  scenario "タスク一覧のテスト" do
    Task.create!(name: 'test_task_01', description: 'samplesample')
    Task.create!(name: 'test_task_02', description: 'testtesttest')
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    # save_and_open_page
    fill_in 'task_name', with: 'test_task_01'
    fill_in 'task_description', with: 'test_task_02'
    click_on '登録する'
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'test_task_02'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create(name:'ttt', description: 'ttt',deadline: '2019.10.29')
    visit task_path(@task)
    page.first("#show").click
    expect(page).to have_content 'ttt'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    Task.create!(name: 'test_task_01', description: 'testtesttest')
    Task.create!(name: 'test_task_02', description: 'samplesample')

    visit tasks_path
    # save_and_open_page
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    click_on '終了期限でソートする'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end
  
  scenario "タスクが終了期限の降順に並んでいるかのテスト" do
    visit tasks_path
    click_on '終了期限でソートする'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "viewにてタスクが絞り込めるかのテスト" do
    visit tasks_path
    fill_in 'task_name', with: 'Factoryで作ったデフォルトのタイトル１'
    select '未着手', from: '未着手'
    click_button 'search'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content '未着手'
  end
end