# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_26_073927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "commentable_id"
    t.string "commentable_type"
    t.string "message"
    t.bigint "commenter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "title"
    t.text "description"
    t.string "source_type"
    t.string "media_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_contents_on_artist_id"
  end

  create_table "contents_properties", force: :cascade do |t|
    t.bigint "property_id"
    t.bigint "content_id"
    t.integer "value"
    t.index ["content_id"], name: "index_contents_properties_on_content_id"
    t.index ["property_id"], name: "index_contents_properties_on_property_id"
  end

  create_table "instagram_posts", force: :cascade do |t|
    t.string "link"
    t.string "media_hash"
    t.text "caption"
    t.string "instagram_username"
    t.bigint "curator_id"
    t.bigint "reviewer_id"
    t.index ["curator_id"], name: "index_instagram_posts_on_curator_id"
    t.index ["reviewer_id"], name: "index_instagram_posts_on_reviewer_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "likable_id"
    t.string "likable_type"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "icon"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_properties_on_admin_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review_text"
    t.bigint "reviewer_id"
    t.bigint "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "media_hash"
    t.index ["content_id"], name: "index_reviews_on_content_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "reviews_properties", force: :cascade do |t|
    t.bigint "review_id"
    t.bigint "property_id"
    t.integer "value"
    t.index ["property_id"], name: "index_reviews_properties_on_property_id"
    t.index ["review_id"], name: "index_reviews_properties_on_review_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "admin"
    t.boolean "viewer"
    t.boolean "artist"
    t.boolean "reviewer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
  end

  create_table "users_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
