## アプリケーション名:BodyRecord
---
## アプリケーション概要
- 各項目を入力することで基礎代謝量など減量の参考になる値を計算し表示を行う。またログインすることで体重、体脂肪を記録でき、グラフ化することで日々の変化を捉えやすくる。
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
- ログインし各項目の値を入力し記録するとそれを元に計算し結果とグラフが表示される。
- 未ログインでも各項目に値を入力すれば計算し結果を表示される。ただし記録とグラフの表示は行われない。
---
## 目指した課題解決
- 減量に必要な値や様子をより簡単に捉えられるようにする。
---
## 洗い出した要件
- 計算結果表示機能（性別、年齢、身長、体重、体脂肪率、たんぱく質、脂肪、炭水化物、目標体脂肪率を元に計算しBMI、基礎代謝、各栄養素摂取量、目標体脂肪率までの減量kcalを表示）
- ユーザー管理機能（新規登録、ログイン・ログアウト機能）
- データの入力および記録機能（計算に必要な値の入力、保存、変更機能及び日々の体重、体脂肪率を記録）
- グラフ機能（指定した期間の体重、体脂肪及び目標体脂肪率をグラフ表示）
---
## 実装した機能についての画像やGIFおよびその説明
- ログイン機能、記録した体重,体脂肪率をグラフ化、記録してある項目を元に計算し基礎代謝量などを表示 

https://gyazo.com/87370663f1959fa30eea7e154a4065ff
- データの入力画面 

https://gyazo.com/e2dafc089539f62bbd41ecacfeef1864

---
## 実装予定の機能
- 指定した期間のデーターをグラフ表示する
- 画像登録機能
---
## データベース設計
	
## usersテーブル

|Column             |Type   |Options                   |
|-------------------|-------|--------------------------|
|name               |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |

### Association
- has_one : bodyテーブル


## bodiesテーブル

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|gender |integer    |null: false                    |
|age    |integer    |null: false                    |
|tall   |integer    |null: false                    |
|user   |references |null: false, foreign_key: true |

### Association
- has_one : nutrientテーブル
- belongs_to :userテーブル


## nutrientsテーブル

|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|protein        |float      |null: false                    |
|fat            |float      |null: false                    |
|carbohydrate   |float      |null: false                    |
|goal_body_fat  |date       |null: false                    |
|body           |references |null: false, foreign_key: true |

### Association
- has_many :fatsテーブル
- belongs_to :bodyテーブル


## fatsテーブル

|Column   |Type       |Options                        |
|---------|-----------|-------------------------------|
|day      |date       |null: false                    |
|weight   |float      |null: false                    |
|body_fat |float      |null: false                    |
|nutrient |references |null: false, foreign_key: true |

### Association
- belongs_to :nutrientテーブル
---
## ローカルでの動作方法
git clone git@github.com:HSKINK/bodyrecord.git

rails s

(ruby バージョン '2.6.5') (rails バージョン '6.0.0')
