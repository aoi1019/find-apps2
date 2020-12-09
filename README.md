# 📌 Find Apps
個人規模のオリジナルアプリをシェアするサービスです。

※こちらは前回のサービスのリメイク版です。<br>
【前回のGitHubリポジトリ】https://github.com/aoi1019/find-apps

独自ドメインで公開中です。（追加実装中）<br>
https://find-apps.net/
## 🌐 アプリのトップページ
[![Image from Gyazo](https://i.gyazo.com/0df7360c4eca187a09e8138d30f6565e.jpg)](https://gyazo.com/0df7360c4eca187a09e8138d30f6565e)

# 📕 アプリ概要
### 自分で開発したオリジナルアプリを世界中にシェアする。<br>これを実現できるように設計されたサービスです。


# 📚 目指した課題解決
私は、アプリを開発する際に「私と同じ駆け出しエンジニアは、どんなアプリを開発しているのだろうか。」と疑問に思い、Googleで検索するもあまりヒットはしませんでした。

それなら、私が**オリジナルアプリのまとめサイトを作ってしまおう**と思い開発しました。

## ✔︎ 具体的に知りたい情報は以下です。
- どのプログラミング言語？
- 本番環境の状態は？（URL見たい！）
- 開発期間はどれくらい？
- どのスクールに通っている？もしくは独学？
- 開発したポイントはあるのだろうか？

上記の通りです。<br>
**この疑問を解決するサービスを開発しました。**

## ✔︎ ペルソナは3人います
- **これからプログラミングの勉強をする方**
  - 「このスクールではこのレベルのアプリが開発できるのか」と入る前にザックリ理解できるため。
  - 「独学でもこのレベルまで開発できるのか」とモチベーションが上がるため。
- **いざ開発しようと思った時に何を作ろうか迷っている方**
  - Find Appsに投稿されているアプリを見て「このアイディアいいな！」など思えるため。
  - スクールの先輩のオリジナルアプリが見れるため。
  - 他の人のアプリのレベル感がわかるため。
- **企業の採用担当者様**
  - 新しい人材を確保したいが経験値のあるエンジニアの確保は難しい。そこで「未経験のエンジニアでも技術力があって面白いアイディアがあるなら採用したい」と考えるため。
  - DM機能を追加してそれぞれがメッセージでやりとりができるようになれば最高なため。


# 📌 アプリ機能
## ✔︎ ゲストログイン機能
トップページの「<font color="IndianRed">**ゲストログイン**</font>」をクリックするだけで簡単にログインできます。
<!-- ### 🌐 **実際の挙動**
[![Image from Gyazo](https://i.gyazo.com/117c6cf7ebf506981dae327b58ae2fec.gif)](https://gyazo.com/117c6cf7ebf506981dae327b58ae2fec) -->

## ✔︎ ユーザー登録機能
新規登録時には以下の情報のみで登録できます。
- 名前
- メールアドレス
- パスワード
- 確認用パスワード

## ✔︎ ユーザー編集機能
新規登録時に登録できなかった点を編集ページで編集することができます。
- 名前 <font color="IndianRed">[必須]</font>
- プロフィール画像
- 自己紹介文
- Twitterアカウント
- 出身スクール選択（独学・その他もあり） <font color="IndianRed">[必須]</font>
<!-- ### 🌐 **実際の挙動**
[![Image from Gyazo](https://i.gyazo.com/fa57d5b8796080d293e42df12c38b7c0.gif)](https://gyazo.com/fa57d5b8796080d293e42df12c38b7c0) -->

## ✔︎ アプリ投稿 / 編集機能
- アプリの名称 <font color="IndianRed">[必須]</font>
- アプリの画像 <font color="IndianRed">[必須]</font>
- アプリの説明
- 開発ポイント
- 開発言語 <font color="IndianRed">[必須]</font>
- アプリのURL <font color="IndianRed">[必須]</font>
- 開発期間[日]

<!-- [![Image from Gyazo](https://i.gyazo.com/a990e548c2c28c22a86e919aa53f9698.png)](https://gyazo.com/a990e548c2c28c22a86e919aa53f9698) -->

## ✔ コメント / コメント削除機能
- コメントできる
- 自分で送信したコメントを削除できる
- 投稿にコメントが何個あるか確認できる
<!-- ### 🌐 **実際の挙動**
[![Image from Gyazo](https://i.gyazo.com/dab36da8676662d6ef8ec213c9a46e7c.gif)](https://gyazo.com/dab36da8676662d6ef8ec213c9a46e7c) -->

## ✔︎ いいね / いいね解除機能
- **1人のユーザーは1つの投稿に1回いいねができる**
- いいねすると赤色に変化
- いいね解除すると元の色に戻る
- Ajaxによる開発
<!-- ### 🌐 **実際の挙動**
[![Image from Gyazo](https://i.gyazo.com/fc3afa1c5dc6fd92cff95dc1d4e5306b.gif)](https://gyazo.com/fc3afa1c5dc6fd92cff95dc1d4e5306b) -->

## ✔︎ お気に入り登録 / 解除機能
- お気に入り一覧ページ
- お気に入り登録をすると灰色に変化
- お気に入り解除すると青色に戻る
- Ajaxによる登録・解除

## ✔︎ 通知機能
- コメント・いいねされたら相手に通知がいく
- 通知があると赤色に変化
- 通知ページを開いたら色が元に戻る
- 通知一覧ページ

## ✔︎ SNS認証登録・ログイン
- Googleアカウントを使って新規登録・ログインができる
- Facebookアカウントを使って新規登録・ログインができる

## ✔︎ reCAPTCHAを使って新規登録
- 新規登録時にチェックを入れないと登録ができません。

[![Image from Gyazo](https://i.gyazo.com/045ff8e3288f22a68fbe35ad1f81cd4b.gif)](https://gyazo.com/045ff8e3288f22a68fbe35ad1f81cd4b)

## ✔︎ 検索機能
- アプリ名
- 開発プログラミング言語
- ユーザー名

上記の2つを検索することができます。

※gemは活用していません。


## ✔︎ スクール受講生の一覧表示ページを作成
- 最後になりましたが、こちらが**1番実装したかったポイントになります！！**
- プロフィール編集時に選択するプログラミングスクールですが、同じスクール生は一覧ページにまとめて表示するように試みました。
画像の通りです。
クリックするとスクール生の一覧ページに遷移できます。

お時間がある方はぜひお試しください！

[![Image from Gyazo](https://i.gyazo.com/2709235c411742411e9c278edbfd0d73.png)](https://gyazo.com/2709235c411742411e9c278edbfd0d73)

# 💻 使用技術
- HTML / CSS
- Bootstrap / Sass
- Javascript
- Ruby 2.6.5
- Ruby on Rails 6.0.3.4
- MySQL 5.6
- RSpec

## 🖥 インフラ・本番環境
- AWS (S3, EC2, Route53, Elastic Load Balancer)
- Nginx
- Unicorn
- MariaDB
- Capistrano 3.14.1 (自動デプロイ) 

## 🖥 ソースコード管理
- Git
- GitHub

# 📌 実装予定の機能
- 検索機能：アプリ名・開発言語で検索できる機能を実装します。
- 通知機能：いいねやコメントされた時に相手方に通知が行く機能を実装します。
- DM機能：それぞれが個人のチャットで会話ができる実装をします。

# 📚 テーブル設計


[![Image from Gyazo](https://i.gyazo.com/05a15461a0d2b64a424e9b3a8bf64018.png)](https://gyazo.com/05a15461a0d2b64a424e9b3a8bf64018)



# 📌 SNS
- [» Twitterはこちら](https://twitter.com/aoi_programming)
- [» Qiitaはこちら](https://qiita.com/aoi1019m)
- [» BLOGはこちら](https://tech.aoiblog.net)
- [» Affiliate Siteはこちら](https://aoiblog.net)
- [» GitHubはこちら](https://github.com/aoi1019/)
