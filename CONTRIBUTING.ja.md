# コントリビュート
`UITableView` のサンプル集です。いつでもコントリビューション大歓迎です！

フォルダ分けは下記の通り。

* DefaultsAppearances -> カスタムクラスを使わずに見た目をいじったやつ
* Operations -> カスタムクラスを使わずにやる操作系のやつ（選択・移動・削除など）
* Customs -> カスタムクラスを使用してつくるやつ

## コントリビュートする方法
追加する場所に迷ったらCustoms に入れてください。

Issueにあるやつか新たにIssueをたてて作業して下さい。

他の人と重複して作業してしまうことを防ぐために "🙋"などでいいのでコメントをしてください。

（めっちゃDroidKaigiのやつ意識した🤐）

## 画面追加方法
 該当のIndexViewControllerにStoryboardボタンを追加する
 
その後は下記いずれかの方法（Storyboardでのコンフリクトが嫌な場合は２個目がおすすめ）

* 該当のStoryboardに画面を追加してボタンをsegueでつなぐ
* 新規でStoryboardを追加してIndexViewControllerにコードで遷移処理をかく

Storyboardやxibなどファイルが複数になる場合はフォルダにまとめていただけるとありがたいです🙇‍♂️
