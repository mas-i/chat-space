# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|mail|string|null: false, unique: true|
|password|string|null: false, unique: true|
|group_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|

### Association
- hasmany :groups
- hasmany :messages
- belongs_to :groups_users

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|chat_name|string|null: false, unique: true|
|user_id|integer|null: false, goreign_key: true|

### Association
- hasmany :users
- belongs_to :groups_users

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false, foreign_kei: true|
|image|string|foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- hasmany :users
- hasmany :groups
- belongs_to :groups_users

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## messages_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|messages_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :message
- belongs_to :group

## messages_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :message