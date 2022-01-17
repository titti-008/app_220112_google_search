# README

Google custom search JSON APIを用いたgoogle検索ミラーサイトです。

## 起動方法
1. GCPにて、APIキーと検索エンジンIDを取得する

2. ルートディレクトリに「.env.development」を作成し、下記を記述する
```.env.development
API_KEY=<取得したAPIキー>
SEARCH_ENGINE_ID=<取得したID>
```
  ※本番環境の環境変数は別途環境に応じて設定が必要

3. 開発サーバーを起動する
```
rails s
```
