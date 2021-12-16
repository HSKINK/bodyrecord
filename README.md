## アプリケーション名:BodyRecord
---
## アプリケーション概要
- 登録し各項目を入力することで基礎代謝量など減量の参考になる値の計算を行う。また体重、体脂肪を記録し、グラフ化することで日々の変化を捉えやすくる。
---
## URL
  https://bodyrecord.herokuapp.com/

---
## ID/Pass
    ID:admin  
    Pass:2222
---
## テスト用アカウント
    メールアドレス：test@test.com
    パスワード：test12
---
## 利用方法
- ログインし日々、各項目の値を入力する。
---
## 目指した課題解決
- 自身の減量に必要な値や様子をより簡単に捉えるようにする。
---
## 洗い出した要件
- 計算結果表示機能、データ記録機能、グラフ化機能、ログイン機能
---
## 実装した機能についての画像やGIFおよびその説明
- ログイン機能、記録した体重,体脂肪率をグラフ化、記録してある項目を元に計算し基礎代謝量などを表示 

https://gyazo.com/87370663f1959fa30eea7e154a4065ff
- データの入力画面 

https://gyazo.com/e2dafc089539f62bbd41ecacfeef1864

---
## 実装予定の機能
- 記録した項目の編集機能
- 記録した項目の削除機能
- 非ログインでもデータを入力すると計算して結果を表示する機能
- 写真投稿機能
- グラフの縦軸、横軸の幅変更機能
---
## データベース設計
	
## usersテーブル

|Column             |Type   |Options                   |
|-------------------|-------|--------------------------|
|name               |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |

### Association
- has_many : fatsテーブル


## fatsテーブル

|Column   |Type       |Options                        |
|---------|-----------|-------------------------------|
|weight   |float      |null: false                    |
|body_fat |float      |null: false                    |
|user     |references |null: false, foreign_key: true |

### Association
- belongs_to :userテーブル
- has_one :bodyテーブル


## bodiesテーブル

|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|sex           |integer    |null: false                    |
|age           |integer    |null: false                    |
|height        |integer    |null: false                    |
|nutrients_p   |integer    |null: false                    |
|nutrients_f   |integer    |null: false                    |
|nutrients_c   |integer    |null: false                    |
|goal_body_fat |float      |                               |
|fat           |references |null: false, foreign_key: true |

### Association
- belongs_to :fatテーブル
---
## ローカルでの動作方法
git clone git@github.com:HSKINK/bodyrecord.git

rails s

(ruby バージョン '2.6.5') (rails バージョン '6.0.0')
