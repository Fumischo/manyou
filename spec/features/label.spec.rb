require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:label_user)
    FactoryBot.create(:label)
    FactoryBot.create(:label_task)
    FactoryBot.create(:second_label_task)
    FactoryBot.create(:label_task)
    FactoryBot.create(:second_label_user)
    FactoryBot.create(:labeling)
    FactoryBot.create(:second_label)
    FactoryBot.create(:second_label_task)
    FactoryBot.create(:second_labeling)
  end
  before do
    visit new_session_path
    fill_in 'session[email]', with: 'f@example.com'
    fill_in 'session[password]', with: 'damnfuck'
    click_button 'Log in'
  end
  
  scenario "ラベル検索でラベル名を絞り込めるかのテスト" do
    visit tasks_path
    select 'fumischo', from: 'label_id'
    click_button 'Search'
    binding.pry
    save_and_open_page
    expect(page).to have_content 'fumischo'
  end
end