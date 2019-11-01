# *バージョン情報*
> Ruby 2.6.5    
Rails 5.2.3

# 1. デプロイ手順

## 1. Herokuへログイン  
  > $ heroku login

## 2. アプリケーション作成  
  > $ heroku create アプリ名

## 3. herokuにデプロイ  
  > $ git push heroku master (ブランチがマスターの場合)

  ### マスタブランチ以外の場合

  > git push heroku 作業ブランチ名:master

## 4. dbのマイグレート  
  > $ heroku run db:migrate

## 5. アプリケーション実行
  > $ heroku open

  # 2. *テーブル定義*

# Userテーブル

| カラム名            | データ型    |
| --------------- | ------: |
| id              |         |
| name            | string  |
| email           | string  |
| password_digest | string  |
| admin           | boolean |


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