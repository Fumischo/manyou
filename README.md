
# Userテーブル

| Column          | Data type |
| --------------- | --------: |
| id              |           |
| name            | string    |
| email           | string    |
| password_digest | string    |


# Taskテーブル

| Column      | Data type |
| ----------- | --------: |
| id          |           |
| title       | string    |
| description | text      |
| deadline    | datetime  |
| user_id(FK) | integer   |
|             |           |
|             |           |


# Statusテーブル

| Column        | Data Type |
| ------------- | --------: |
| id            |           |
| status_id(FK) | integer   |



# Labelテーブル

| Column      | Data Type |
| ----------- | --------: |
| id          |           |
| task_id(FK) | integer   |