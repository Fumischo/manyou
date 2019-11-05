require 'rails_helper'


RSpec.feature "管理者機能", type: :feature do
  background do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
    visit new_session_path
    fill_in "session_email" ,with: "hoge@example.com"
    fill_in "session_password", with: "damnit"
    click_on "Log in"
  end

  scenario "ユーザー一覧のテスト" do
    visit admin_users_path
    expect(page).to have_content 'fumi'
    expect(page).to have_content 'fumi2'
  end

  scenario "ユーザー作成のテスト" do
    visit new_admin_user_path
    fill_in 'user_name', with: 'fumi'
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'damnit'
    fill_in 'user_password_confirmation', with: 'damnit'
    click_on 'Create user'
    expect(page).to have_content "fumi"
  end

  scenario "ユーザー詳細のテスト" do
    visit admin_users_path
    click_link 'fumi'
    expect(page).to have_content 'fumi'
  end

  scenario "ユーザー編集のテスト" do
    visit admin_users_path
    click_link '編集', match: :first
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'damnit'
    fill_in 'user_password_confirmation', with: 'damnit'
    click_on 'Create user'
    save_and_open_page
    expect(page).to have_content "fumi"
  end
  scenario "ユーザー削除のテスト" do
    visit new_admin_user_path
    fill_in 'user_name', with: 'fumi'
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'damnit'
    fill_in 'user_password_confirmation', with: 'damnit'
    click_on 'Create user'
    expect(page).to have_content 'fumi'
    click_link '削除', match: :first
    expect(page).to have_content 'fumi'
  end
end