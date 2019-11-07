require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:label_user)
    FactoryBot.create(:second_label_user)
    FactoryBot.create(:label)
    FactoryBot.create(:second_label)
    FactoryBot.create(:label_task)
    FactoryBot.create(:second_label_task)
    FactoryBot.create(:labeling)
    FactoryBot.create(:second_labeling)
  end
  before do
    visit new_session_path
    fill_in 'session[email]', with: 'f@example.com'
    fill_in 'session[password]', with: 'damnfuck'
    click_button 'Log in'
  end

  scenario "ラベルユーザー１一覧のテスト" do
    visit tasks_path
    save_and_open_page
    select 'fumischo', from: 'label_id'
    click_button 'Search'
    expect(page).to have_content 'fumischo'
  end
end