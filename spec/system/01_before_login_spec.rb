require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do # itの処理をする前に行う処理
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it "鉄分とは？と表示される" do
        expect(page).to have_content "鉄分とは？"
      end
      it "記事一覧ページへと表示される" do
        expect(page).to have_content "記事一覧ページへ"
      end
      it '新規登録リンクが表示される:左上から3番目のリンクが新規登録である' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match(//i)
      end
      it 'ログインリンクが表示される:左上から4番目のリンクがログインである' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(log_in_link).to match(//i)
      end
    end

    context 'リンク内容を確認' do
      it '記事一覧リンクの内容が正しい' do
        trains_link = find_all('a')[1].native.inner_text
        expect(page).to have_link trains_link, href: trains_path
      end
      it '新規登録リンクの内容が正しい' do
        sign_up_link = find_all('a')[2].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
      it 'ログインリンクの内容が正しい' do
        log_in_link = find_all('a')[3].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
      it 'ゲストログインリンクの内容が正しい' do
        guest_log_in_link = find_all('a')[4].native.inner_text
        expect(page).to have_link guest_log_in_link, href: users_guest_sign_in_path
      end
    end
  end

  describe 'ヘッダーのテスト：ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it '新規登録リンクが表示される:左上から3番目のリンクが新規登録である' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match(//i)
      end
      it 'ログインリンクが表示される:左上から4番目のリンクがログインである' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(log_in_link).to match(//i)
      end
    end

    context 'リンク内容を確認' do
      subject { current_path } # 対象

      it 'ロゴを押すとトップ画面に遷移する' do
        click_link 'nav-link0'
        is_expected.to eq '/'
      end
      it '新規登録のアイコンを押すと新規登録画面に遷移する' do
        click_link 'nav-link6' # リンクのクリック 'クリックしたいnameかidを入れる'
        is_expected.to eq '/users/sign_up'
      end
      it '新規登録のアイコンを押すとログイン画面に遷移する' do
        click_link 'nav-link7'
        is_expected.to eq '/users/sign_in'
      end
      it 'ゲストログインするを押すとホーム画面に遷移する' do
        click_link 'ゲストログインする'
        is_expected.to eq '/'
      end
    end
  end

  describe 'ユーザー新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '新規登録と表示される' do
        expect(page).to have_content '新規登録' # 文字列が存在するか
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'user[name]' # 入力フォームが存在するか 'モデル名/カラム名'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page). to have_button '新規登録' # ページ上に指定のボタンが存在するか
      end
    end

    context 'リンク内容を確認' do
      subject { current_path }

      it 'ログインアイコンを押すとログイン画面に遷移する' do
        click_link 'nav-link7'
        is_expected.to eq '/users/sign_in'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 5) # nameかidを入力する
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(User.all, :count).by(1) # クリックボタンを押すとUserモデルのデータカウントが１増える
      end
      it '新規登録後のリダイレクト先がマイページになっている' do
        click_button '新規登録'
        expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end

    context '新規登録失敗のテスト' do
      before do
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button '新規登録'
      end

      it '新規登録に失敗し、新規登録画面にリダイレクトされる' do
        expect(current_path).to eq '/users'
      end
    end
  end

  describe 'ユーザーログインのテスト' do
    let(:user) { create(:user) } # @user = user.createと同じ意味
    # letはインスタンス変数やローカル変数をletという機能で置き換えることができる

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it 'ログインと表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      it '新規登録リンクが表示される:上から3番目のリンクが新規登録である' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match(//i)
      end
    end

    context 'リンク内容を確認' do
      subject { current_path }

      it '新規登録を押すと新規登録画面に遷移する' do
        click_link 'nav-link6'
        is_expected.to eq '/users/sign_up'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先がマイページになっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[name]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end
end
