# Kream Marketplace - A place for designer clothing
### Problem
I came up with the idea of kream from useing sites such as www.stockx.com and www.grailed.com. With the growing popularity of American culture in Australia many consumers are turning to American sites to stay on board with trend in the fashion industry.  Unfortunatly These sites are based in america and shipping would sometimes take weeks to get your product resulting in damaged freight and a lackluster experience.  There is a large scene in Australia based around streetfashion and last year the "streetwear market" was estimated to have a market value of $185 billion dollars, Making it around 10% of the golobal apparel and footwear market
### Solution
Kream was created to fill the gap in the market for Australian consumers.  It gives them the owwwwwwwaption to sign up sell and bye products and chat to other users.  It also alows admin to track products for sale and the growth of the website using chartkick and groupdate.  

### link to deployed site
[link to Heroku](https://morning-wave-82909.herokuapp.com/)
### GitHub link
[Link To GitHub](https://github.com/alex1092/kream)

## Purpose
Using insporation from American sites like stockx and grailed kream Is a platform for Australian consumers to take part in an ever-growing industry and subculture giving them a space to buy and sell used or new sneakers or apparrel.

## Functionality/Features
* Kream features an easy to use navigation bar allowing users to move around the site with some restrictions thanks to rolify which adds authorizion functionality. 
* Users can sign up either using oniauth which is connected to facebook or simply bye entering their details on the sign-up page, which was created using the devise gem.  Using devise kream can create unique users with their email being there primary key
* Using the scaffold feature in ruby on rails a scaffold was created for products.  The products scaffold accepts a category (Sneakers, Apparel or Accesories), a brand, style, price, size and using Amazon sw the user can upload dynamic images to be saved on amazons sw bucket.
* The home page features 4 secitions, A navbar for easy navigation, A carousel of pictures which can be used to market featured items, and 6 randomly shuffled sneakers and shoes.
* Kream also has a private messanging function, alowing users to read and send messages between one another.
* If a user has authorization and is an administator they will have access to the Admin menu.  Here a dashboard can be found which has links to various options (Which are yet to be implemented) The administrator can also view what products are for sale and visually see using chartkick how many members have signed up to the site.
* The user can search for products from the nav menu or with either apparel or sneakers.  The search function is powered by pg_search and is searching the brand and style columns within the products table.  Using pg_searches inbuilt methods tsearch the user only needs to search for a small part of the word to find what they are looking for.
* Using ruby methods the nav bar will change depending on wether you are authorized, authenticated or just a guest.  An admin will have acces to products, selling, chat, their profile page and the admin page.  Authenticated users will have access to everything besides the admin page and guests will just have access to everything besideds My profile chat and the admin page

## sitemap
[Link To Admin Sitemap](docs/admin-sitemap.png)
[Link To User sitemap](docs/user-signed-in-kream.png)
[Link To Guest Sitemap](docs/guest-kream.png)

## screenshots


## target audience

The target audience for Kream is Men and Women aged between 16 and 35.  Younger individuales are commited fans to brands like supreme, yeezy and nike.  You can see lines around the corner of every supreme store every thursday for their weekly drop.  Kream will not only act as a proxy for people to sell their shoes but will also act as a marketplace for others to purchase 

## tech stack (e.g. html, css, deployment platform etc)

Kream was built using ruby on rails and is deployed on heorku, it also uses bootstrap's css framework and Jquery apart of bootstrap.

## User stories
[Link to user Stories](docs/user_stories.png)

## wireframes

[Link To wireframes](\docs\kream-wireframes.png)

## erd

[Link To Wireframes](docs/KREAM-ERD.png)

## High level components description

Essentially the entire app is based around the User model and the Products model.  The user model alows users to be created edited updated and deleted, allowing users to freely sign up and destroy their profiles as they wish.  The products model and controller handles the products,  While a user is signed in they are able to CRUD products at their will.  

## Third party apps and apis

* aws-sdk-s3 - This is used to connect sw to the website so a user can upload dynamic images it is an application built by amazon web services.  It is used to store and hold images users upload

* stripe - stipe is used as a payment gateway and haldes all transactions through the site.  They are CCA complient therfore the are legally aloud to accept credit card payment

* bootstrap_form - bootstra_form is a rails form builder that makes it super easy to integrate bootstrap forms into your rails application.  It provides a helper that augments the rails form helper

* devise - Devise is a flexible authentication solution for Rails based on Warden. It: Is Rack based; Is a complete MVC solution based on Rails engines; Allows you to have multiple models signed in at the same time; Is based on a modularity concept: use only what you really need.

* devise bootstrap views - This is a framework used to create bootstrap styled views for the devise layout

* rolify - rolify is used to create authorization on a resource object

* Omniauth - OmniAuth is a library that standardizes multi-provider authentication for web applications. It was created to be powerful, flexible, and do as little as possible. Any developer can create strategies for OmniAuth that can authenticate users via disparate systems. OmniAuth strategies have been created for everything from Facebook to LDAP.

* chartkick - chartkick is used on the admin page to create a graph

* groupdate - groupdate is used in correlation with chartkick for the graph

* pg-search - PgSearch builds named scopes that take advantage of PostgreSQL's full text search. We are using pg_search on the products table while referencing the brand and style


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

