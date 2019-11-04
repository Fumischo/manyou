require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do
  background do
    @other_user = FactoryBot.create(:user)
    visit new_user_path
    fill_in "user_name", with: "fumi"
    fill_in "user_email", with: "hoge1@example.com"
    fill_in "user_password", with: "damnit"
    fill_in "user_password_confirmation", with: "damnit"
    click_button "Create my account"
  end

  scenario "ユーザー登録" do
    expect(page).to have_content 'Profile Logout'
  end

  scenario "ログイン中はユーザー登録画面に行けない" do
    visit new_user_path
    expect(page).to have_content '既にログイン済です'
  end

  scenario "他人のマイページにはいけない" do
    visit user_path(@other_user.id)
    expect(page).to have_content 'fumiのページ'
  end
end
