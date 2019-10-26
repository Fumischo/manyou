## バージョン情報
Ruby 2.6.3

Rails 5.2.3


# Userテーブル

| カラム名            | データ型    |
| --------------- | ------: |
| id              |         |
| name            | string  |
| email           | string  |
| password_digest | string  |
| admin           | boolean |
|                 |         |


# Taskテーブル

| カラム名        | データ型     |
| ----------- | -------: |
| id          |          |
| title       | string   |
| description | text     |
| deadline    | datetime |
| user_id(FK) | integer  |
| priority    | integer  |
| user_id     | bigint   |
|             |          |


# Statusテーブル

| カラム名       | データ型 |
| ------------- | --------: |
| id            |           |
| status_id(FK) | integer   |



# Labelテーブル

| Column      | Data Type |
| ----------- | --------: |
| id          |           |
| task_id(FK) | integer   |