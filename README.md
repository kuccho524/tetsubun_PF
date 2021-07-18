# 鉄分
サイトURL：https://tetsubun-tetsudo.com/

## ご利用にあたって
### <お手軽に触りたい方>
ゲストログインをお願いします。<br>
※ゲストログインはユーザ情報編集機能にのみ制限をかけています。<br>

### <しっかり触りたい方>
ユーザ情報編集機能も触られる方は、ヘッダーの一番右のアイコンから下記でログインをお願いいたします。<br>
ユーザ名：hide<br>
パスワード：password<br>

## サイト概要
「鉄分」とは、「鉄道に支えられている部分や、割合あるいは充実度」を表す言葉の略語である通り、<br>
「鉄道」に特化したSNSです。<br>
メインの機能としましては、写真と本文を入力した記事の投稿、記事編集と削除です。<br>
また、上記の機能以外に、投稿された記事に対してのいいね、コメント、<br>
ユーザ間のやりとりでは、フォロー、ダイレクトメッセージを実装しました。

### サイトテーマ
鉄道に特化した写真が見れるSNSです。

### テーマを選んだ理由
コロナ禍で人の動きが制限されている中で、<br>
鉄道や旅行に触れられるものを作成したいと感じたこと、<br>
また、鉄道に特化したSNSが少ないと感じたため、<br>
「鉄分」を製作することに至りました。<br>

### 他のSNSとの違い
FaceBookなどの有名なSNSは利用していて少し複雑だなと感じたため、<br>
実装する機能を絞り、掲示板のようなシンプルな見た目を意識して製作しました。

### ターゲットユーザ
鉄道好きの人。

### 主な利用シーン
鉄道に触れたい時、鉄道の写真を楽しみたい時<br>
自分が撮影した鉄道の写真を公開したい時<br>
鉄道をきっかけに交流を広げたい時

### 設計書
<ul>
  <li>
    <a href="https://docs.google.com/presentation/d/1x784pqVEqCAz56WZRL-58tzVA4ksWyoe/edit#slide=id.p1">画面遷移図</a>
  </li>
  <li>
    <a href="https://drive.google.com/file/d/1HkoP6Zt81_0ExnAuyxt7Wlo1jUF1dtiu/view">ER図</a>
  </li>
  <li>
    <a href="https://docs.google.com/spreadsheets/d/1Ue5IUjEn4C_pJGp478CfMVnlBtA3ijqe/edit#gid=79538340">テーブル定義書</a>
  </li>
  <li>
    <a href="https://docs.google.com/spreadsheets/d/17LlS8oGryjKE0sBG0XpksbKoVZ5obTZg/edit#gid=1281505798">アプリケーション詳細設計書</a>
  </li>
  <li>
    <a href="https://docs.google.com/presentation/d/19rQs_M_eBYw2CBvxLmgMPD9DYWT8N5Lq/edit#slide=id.p1">AWS設計図</a>
  </li>
</ul>

### 実装機能一覧
<h4>メイン機能</h4>
<ul>
  <li>
    ユーザログイン機能
  </li>
  <li>
    記事の投稿/編集/削除機能(CRUD機能)
  </li>
</ul>

<h4>記事に対して実装した機能</h4>
<ul>
  <li>
    いいね機能
  </li>
  <li>
    コメント機能
  </li>
</ul>

<h4>ユーザに対して実装した機能</h4>
<ul>
  <li>
    フォロー機能
  </li>
  <li>
    DM機能
  </li>
</ul>

<h4><a href="https://docs.google.com/spreadsheets/d/1Y4alK0mXdi5_dgJfUNuOS4w_xBcWF-woQOjHPi65cQ0/edit#gid=1373494904">その他チャレンジ要素を含む機能一覧</a></h4>


### 開発環境
- OS：Linux(CentOS)<br>
- 言語：HTML,CSS,JavaScript,Ruby,SQL<br>
- フレームワーク：Ruby on Rails<br>
- JSライブラリ：jQuery<br>
- IDE：Cloud9<br>

### 使用素材
<a href="https://icooon-mono.com/">ICOOON MONO</a>