# README

Google custom search JSON APIを用いたgoogle検索ミラーサイトです。
  * [メインの処理はこちらに記述](app/controllers/search_controller.rb)

## 考慮した点
  * APIキーとIDは環境変数として設定し、.gitignoreで非公開とした。
  * RSpec systemテストの勉強を兼ねてテストコードを書いてみた。
  * [リーダブルコード](https://www.amazon.co.jp/-/en/Dustin-Boswell/dp/4873115655/ref=sr_1_1?adgrpid=104990511112&gclid=CjwKCAiAxJSPBhAoEiwAeO_fP4T0k-boc1q_mipiXNcI3LBqzzhQa2dFwUOtS_-OnAY4IbB9BKWhThoC9w0QAvD_BwE&hvadid=553910598712&hvdev=c&hvlocphy=1009337&hvnetw=g&hvqmt=e&hvrand=2104776009788796319&hvtargid=kwd-334758528225&hydadcr=27298_14478913&jp-ad-ap=0&keywords=%E3%83%AA%E3%83%BC%E3%83%80%E3%83%96%E3%83%AB%E3%82%B3%E3%83%BC%E3%83%89&qid=1642432123&sr=8-1)を参考にリファクタリング
    * 再利用性の向上
    * 可読性の向上
  * 外部API使用時のエラー処理
  * ページネーションの実装



## 起動方法
1. GCPにて、APIキーと検索エンジンIDを取得する

2. ルートディレクトリに「.env.development」を作成し、下記を記述する
```.env.development
API_KEY=<取得したAPIキー>
SEARCH_ENGINE_ID=<取得した検索エンジンID>
```
  ※本番環境の環境変数は別途環境に応じて設定が必要

3. 開発サーバーを起動する
```
rails s
```
