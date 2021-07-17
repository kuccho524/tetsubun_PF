require 'rails_helper'

describe 'ユーザーログイン後のテスト' do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト：ログインしている場合' do
    context '表示内容の確認' do
      it 'Homeリンクが表示される: 左上から1番目のリンクが「Home」である' do
        home_link = find_all('a')[1].native.inner_text
        expect(home_link).to match(//i)
      end
      it '通知一覧リンクが表示される：左上から2番目のリンクが通知一覧である' do
        notifications_link = find_all('a')[2].native.inner_text
        expect(notifications_link).to match(//i)
      end
      it 'チャット一覧リンクが表示される：左上から3番目のリンクがチャット一覧である' do
        chats_link = find_all('a')[3].native.inner_text
        expect(chats_link).to match(//i)
      end
      it 'いいね一覧リンクが表示される：左上から4番目のリンクがいいね一覧である' do
        favorites_link = find_all('a')[4].native.inner_text
        expect(favorites_link).to match(//i)
      end
      it 'マイページリンクが表示される：左上から5番目のリンクがいいね一覧である' do
        mypage_link = find_all('a')[5].native.inner_text
        expect(mypage_link).to match(//i)
      end
      it '記事一覧リンクが表示される：左上から6番目のリンクが記事一覧である' do
        trains_link = find_all('a')[6].native.inner_text
        expect(trains_link).to match(//i)
      end
      it '新規投稿リンクが表示される：左上から7番目のリンクが新規投稿である' do
        new_train_link = find_all('a')[7].native.inner_text
        expect(new_train_link).to match(//i)
      end
      it 'ログアウトリンクが表示される：左上から8番目のリンクがログアウトである' do
        logout_link = find_all('a')[8].native.inner_text
        expect(logout_link).to match(//i)
      end
      it '検索フォームが表示される' do
        expect(page).to have_field '検索'
      end
    end

    context 'リンク内容を確認(LOG OUTは”ユーザーログアウトのテスト”でテスト済み)' do
      subject { current_path }

      it 'ロゴを押すとトップ画面に遷移する' do
        click_link 'nav-link0'
        is_expected.to eq '/'
      end
      it '通知アイコンを押すと通知一覧画面に遷移する' do
        click_link 'nav-link1'
        is_expected.to eq '/notifications/index.' + user.id.to_s
      end
      it 'メッセージアイコンを押すとチャット画面に遷移する' do
        click_link 'nav-link3'
        is_expected.to eq '/rooms.' + user.id.to_s
      end
      it '星マークを押すといいね一覧画面に遷移する' do
        click_link 'nav-link4'
        is_expected.to eq '/favorites.' + user.id.to_s
      end
      it 'マイページを押すとマイページ画面に遷移する' do
        click_link 'nav-link5'
        is_expected.to eq '/users/' + user.id.to_s # '/users/n'
      end
      it '記事一覧を押すとみんなの投稿画面に遷移する' do
        click_link 'nav-link2'
        is_expected.to eq '/trains'
      end
      it '新規投稿アイコンを押すと新規投稿画面に遷移する' do
        click_link 'nav-link8'
        is_expected.to eq '/trains/new'
      end
      it 'ログアウトアイコンを押すとログアウトしてホームに遷移する' do
        click_link 'nav-link9'
        is_expected.to eq '/'
      end
    end
  end

  describe 'ホーム画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認(ヘッダーは確認済み)' do
      it "鉄分とは？と表示される" do
        expect(page).to have_content "鉄分とは？"
      end
      it "新着投稿と表示される" do
        expect(page).to have_content "新着投稿"
      end
    end
  end

  describe 'ユーザーログアウトのテスト' do
    before do
      click_link 'nav-link9'
    end

    context 'ログアウト機能のテスト' do
      subject { current_path }

      it 'ログアウトを押すとトップ画面に遷移する' do
        is_expected.to eq '/'
      end
    end
  end
end