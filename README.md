# テーブル設計

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
- belongs_to :usersテーブル
- has_one :bodiesテーブル


## bodiesテーブル

|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|sex           |integer    |null: false                    |
|age           |integer    |null: false                    |
|height        |integer    |null: false                    |
|p             |integer    |null: false                    |
|f             |integer    |null: false                    |
|c             |integer    |null: false                    |
|goal_body_fat |float      |                               |
|goal_day      |integer    |                               |
|weight        |references |null: false, foreign_key: true |

### Association
- belongs_to :fatsテーブル
