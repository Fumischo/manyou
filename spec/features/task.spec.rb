# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'
# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  background do
    @task = FactoryBot.create(:task)
    @task1 = FactoryBot.create(:second_task)
    @task2 = FactoryBot.create(:third_task)
    
  end
  scenario "タスク一覧のテスト" do
    visit tasks_path
    # save_and_open_page
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント1'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task_name', with: 'Factoryで作ったデフォルトのコンテント1'
    fill_in 'task_description', with: 'Factoryで作ったデフォルトのコンテント1'
    click_on '保存'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント1'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント1'
  end
  scenario "タスク詳細のテスト" do
    visit task_path(@task)
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント1'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル3'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル2'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
    save_and_open_page
  end


  scenario "タスクが終了期限の降順のテスト" do
    visit tasks_path
    click_on '終了期限でソートする'
    # save_and_open_page
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント1'
  end

  scenario "view画面にてタスクを絞り込めるかのテスト" do
    visit tasks_path
    fill_in 'name', with: 'Factoryで作ったデフォルトのタイトル1'
    select '未着手'
    click_button '検索'
    # save_and_open_page

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
    expect(page).to have_content 0
  end

  scenario "タスク優先度の高い順に並び替えのテスト" do
    visit tasks_path(sort_priority: 'true')
    save_and_open_page
    all('table td')[6].click_link '詳細'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル2'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント2'
  end
end