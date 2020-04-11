require 'rails_helper'

describe 'トップページのテスト' do
  let(:user) { create(:user) }
  before do
    visit root_path
  end

  describe 'ボディのテスト' do
    context '表示の確認' do
      it 'Log inリンクが表示される' do
        login_link = find_all('a')[4].native.inner_text
        expect(login_link).to match(/log in/i)
        expect(page).to have_link login_link, href: new_user_session_path
      end
      it 'Sign upリンクが表示される' do
        signup_link = find_all('a')[5].native.inner_text
        expect(signup_link).to match(/sign up/i)
        expect(page).to have_link signup_link, href: new_user_registration_path
      end
    end