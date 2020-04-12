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

    context 'ログインしている場合の挙動を確認' do
      before do
        visit new_user_session_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[password', with: user.password
        click_button 'Log in'
        visit root_path
      end
      it 'Log inリンクをクリックしたらユーザー詳細画面へ遷移する' do
        login_link = find_all('a')[4].native.inner_text
        click_link login_link
        expect(page).to have_content 'User info'
      end
      it 'Sign upリンクをクリックしたらユーザー詳細画面へ遷移する' do
        signup_link = find_all('a')[5].native.inner_text
        click_link signup_link
        expect(page).to have_content 'User info'
      end
    end

    context 'ログインしていない場合の挙動を確認' do
      it 'Log inリンクをクリックしたらログイン画面へ遷移する' do
        login_link = find_all('a')[4].native.inner_text
        click_link login_link
        expect(current_path).to eq(new_user_session_path)
      end
      it 'Sign upリンクをクリックしたらログイン画面へ遷移する' do
        signup_link = find_all('a')[5].native.inner_text
        click_link signup_link
        expect(current_path).to eq(new_user_registration_path)
      end
    end
  end
end
