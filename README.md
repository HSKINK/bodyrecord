## アプリケーション名:BodyRecord
---
## アプリケーション概要
	登録し各項目を入力することで基礎代謝量などの計算を行う。また体重、体脂肪を記録し、グラフ化することで変化を捉えやすくる。
---
## URL	
---

## ID/Pass
    ID:admin  
    Pass:2222
---
## テスト用アカウント
    メールアドレス：
    パスワード：
---
## 利用方法	 
---
## 目指した課題解決
    このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。
---
## 洗い出した要件
	スプレッドシートにまとめた要件定義を記述。
---
## 実装した機能についての画像やGIFおよびその説明
	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
---
## 実装予定の機能
	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。
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
	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。
