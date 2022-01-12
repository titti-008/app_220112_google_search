# README

Google custom search JSON APIを用いたgoogle検索ミラーサイトです。

## 起動方法
1. GCPにて、APIキーと検索エンジンIDを取得する

2. ルートディレクトリに「.env」を作成し、下記を記述する
```.env
API_KEY=<取得したAPIキー>
SEARCH_ENGINE_ID=<取得したID>
```

3. 開発サーバーを起動する
```
rails s
```
