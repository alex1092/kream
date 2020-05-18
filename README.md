# Kream Marketplace - A place for designer clothing
### Problem
I came up with the idea of kream from useing sites such as www.stockx.com and www.grailed.com. These sites are based in america and shipping would sometimes take weeks to get your product.  There is a large scene in Australia based around streetfashion.
### Solution
Kream was created to fill the gap in the market for Australian consumers.  It gives them the option to sign up and sell their products and chat to other users

### link to deployed site
[link to heroku](https://morning-wave-82909.herokuapp.com/)
### github link
[Link To Gihub](https://github.com/alex1092/kream)
## Purpose

Using insporation from American sites like stockx and grailed kream Is a platform for Australian consumers to take part in an ever growing industry and subculture giving them a space to buy and sell used or new sneakers or apparrel.

## Funtionality/Features

## sitemap

## screenshots

## target audience

## tech stack (e.g. html, css, deployment platform etc)

## User stories 

## wireframes

[Link To wireframes](\docs\kream-wireframes.png)

## erd

## High level components descriptoin


## Third party apps and apis

* aws-sdk-s3 - This is used to connect sw to the website so a user can upload dynamic images

* stripe - stipe is used as a payment gateway
font-awesome - font-awseome is used to enable icons within the view

* bootstrap_form - bootstrap form is a framework for creating forms

* devise - devise is used to created authentication 

* devise bootstrap views - This is a framework used to create bootstrap styled views for the devise layout

* rolify - rolify is used to create authorization

* Omniauth facebook - This is used in correlation with devise so users can sign up using their facebook credentials

* chartkick - chartkick is used on the admin page to create a graph

* groupdate - groupdate is used in correlation with chartkick for the graph

* pg-search - pg search is used to search the product model

## Models and relationships

**Application_record.rb** - Application record controls the overall blueprints for all of the following models.

**User.rb** - The user model was created using the devise gem and uses omniauth so users can login through facebook. The user model requires an email name and password. The user has many products.

**Role.rb** - The role model has and belongs to many users by a join table called user_roles.  What the role model does is it enables authorization to users so they can access certain pages.

**Product.rb** - The Product model belongs to a user, has one attached image and is validated to have a catagory, brand, stle, size, price and picture.  Included in the product model is PgSearch which alows users to search for products against its style and brand.  Using the tsearch method a user only has to type a few letters of the item they are seraching for and it will show up.

**Conversation.rb** - The conversation model belongs to a sender and a recipient,  the sender and recipient is a foreign key connected to the User model.  The conversation also has many messages which are dependent.  Conversation.rb also validates the uniquness of the sender id and the recipient id so they can only have one chat room open at a time.

**Message.rb** - Message.rb belongs to both a user and a conversation and validates the presence of a conversation_id, user_id and body which is text.  It also creates a timestamp


## Schema 

```
ActiveRecord::Schema.define(version: 2020_05_15_072242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "brand"
    t.string "style"
    t.string "size"
    t.decimal "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "dob"
    t.string "username"
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "products", "users"
end
```