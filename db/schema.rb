# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150823145207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "acao_tipos", force: :cascade do |t|
    t.integer  "tipo"
    t.string   "nome",         limit: 255
    t.string   "descricao",    limit: 255
    t.string   "image_url",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notification"
  end

  create_table "acoes", force: :cascade do |t|
    t.text     "notificacao"
    t.text     "custom_fields"
    t.integer  "acao_tipo_id"
    t.integer  "user_id"
    t.integer  "acionado_id"
    t.string   "acionado_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",                      default: false
  end

  create_table "anotacoes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "anotavel_id"
    t.string   "anotavel_type", limit: 255
    t.text     "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aulas", force: :cascade do |t|
    t.string   "nome",       limit: 255, null: false
    t.string   "descricao",  limit: 255
    t.integer  "licao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aulas", ["licao_id"], name: "index_aulas_on_licao_id", using: :btree

  create_table "blog_categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
  end

  add_index "blog_categories", ["slug"], name: "index_blog_categories_on_slug", unique: true, using: :btree

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title",              limit: 255,             null: false
    t.text     "body",                                       null: false
    t.integer  "views",                          default: 0, null: false
    t.boolean  "is_public",                                  null: false
    t.integer  "author_id",                                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug",               limit: 255
  end

  add_index "blog_posts", ["author_id"], name: "index_blog_posts_on_author_id", using: :btree
  add_index "blog_posts", ["slug"], name: "index_blog_posts_on_slug", unique: true, using: :btree

  create_table "blog_tags", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
  end

  add_index "blog_tags", ["slug"], name: "index_blog_tags_on_slug", unique: true, using: :btree

  create_table "cantores", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cantores_usuairos", force: :cascade do |t|
    t.integer  "cantores_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", id: false, force: :cascade do |t|
    t.integer "post_id",     null: false
    t.integer "category_id", null: false
  end

  add_index "categories_posts", ["category_id", "post_id"], name: "index_categories_posts_on_category_id_and_post_id", using: :btree
  add_index "categories_posts", ["post_id", "category_id"], name: "index_categories_posts_on_post_id_and_category_id", using: :btree

  create_table "chairs", force: :cascade do |t|
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "class_room_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "class_room_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_room_orders", ["class_room_id"], name: "index_class_room_orders_on_class_room_id", using: :btree
  add_index "class_room_orders", ["order_id"], name: "index_class_room_orders_on_order_id", using: :btree

  create_table "class_rooms", force: :cascade do |t|
    t.integer  "event_id"
    t.decimal  "price"
    t.boolean  "visible"
    t.text     "description_class"
    t.decimal  "discount_porcent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              limit: 255
    t.integer  "capacity"
  end

  create_table "class_teachers", force: :cascade do |t|
    t.integer  "class_room_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "nome",        limit: 255,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descricao"
    t.text     "publico"
    t.text     "aprendizado"
    t.text     "perfil"
    t.text     "links"
    t.boolean  "visivel",                 default: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "dispositivos", force: :cascade do |t|
    t.string   "name"
    t.text     "local"
    t.integer  "lat"
    t.integer  "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dream_categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dream_categories_dreams", id: false, force: :cascade do |t|
    t.integer "dream_id"
    t.integer "dream_category_id"
  end

  add_index "dream_categories_dreams", ["dream_category_id", "dream_id"], name: "index_dream_categories_dreams_on_dream_category_id_and_dream_id", using: :btree
  add_index "dream_categories_dreams", ["dream_id", "dream_category_id"], name: "index_dream_categories_dreams_on_dream_id_and_dream_category_id", using: :btree

  create_table "dreams", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
  end

  add_index "dreams", ["slug"], name: "index_dreams_on_slug", unique: true, using: :btree

  create_table "dreams_powerups", id: false, force: :cascade do |t|
    t.integer "dream_id"
    t.integer "powerup_id"
  end

  add_index "dreams_powerups", ["dream_id", "powerup_id"], name: "index_dreams_powerups_on_dream_id_and_powerup_id", unique: true, using: :btree
  add_index "dreams_powerups", ["powerup_id", "dream_id"], name: "index_dreams_powerups_on_powerup_id_and_dream_id", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "type_event_id"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug",               limit: 255
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "exercicios", force: :cascade do |t|
    t.integer  "licao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "json_data"
  end

  create_table "filmes", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filmes_usuarios", force: :cascade do |t|
    t.integer  "filmes_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "imagens", force: :cascade do |t|
    t.string   "nome",           limit: 255
    t.string   "filename",       limit: 255
    t.string   "url",            limit: 255
    t.integer  "imageable_id"
    t.string   "imageable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_type",         limit: 255
    t.string   "referance_name",     limit: 255
    t.string   "referance_link",     limit: 255
  end

  create_table "instrucoes", force: :cascade do |t|
    t.text "descricao"
  end

  create_table "instrucoes_usuarios", force: :cascade do |t|
    t.integer  "instrucao_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instrutores_cursos", id: false, force: :cascade do |t|
    t.integer  "curso_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licoes", force: :cascade do |t|
    t.string   "nome",       limit: 255, null: false
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descricao"
    t.text     "duracao"
    t.text     "timeline"
  end

  add_index "licoes", ["curso_id"], name: "index_licoes_on_curso_id", using: :btree

  create_table "livros", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "livros_usuarios", force: :cascade do |t|
    t.integer  "livros_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marcas", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marcas_usuarios", force: :cascade do |t|
    t.integer  "marcas_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materiais", force: :cascade do |t|
    t.integer  "curso_id"
    t.string   "nome",       limit: 255
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matriculas", force: :cascade do |t|
    t.integer  "curso_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",       limit: 255
    t.string   "proxima_aula", limit: 255
    t.text     "progresso"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "class_room_id"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.string   "place",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "referable_id",                                  null: false
    t.string   "referable_type",    limit: 255,                 null: false
    t.integer  "actor_id"
    t.string   "actor_type",        limit: 255
    t.integer  "user_id",                                       null: false
    t.string   "message",           limit: 255,                 null: false
    t.integer  "notification_type",                             null: false
    t.boolean  "read",                          default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "item_count"
    t.integer  "cancellation_source"
    t.string   "payment_method",              limit: 255
    t.string   "payment_ref",                 limit: 255
    t.string   "payment_notification_url",    limit: 255
    t.string   "payment_redirect_url",        limit: 255
    t.string   "notification_code",           limit: 255
    t.string   "payment_type",                limit: 255
    t.integer  "payment_code"
    t.float    "gross_amount"
    t.float    "net_amount"
    t.float    "extra_amount"
    t.integer  "installment_count"
    t.float    "creditor_fees"
    t.float    "installment_fee_amount"
    t.float    "operational_fee_amount"
    t.float    "intermidiantion_rate_amount"
    t.float    "intermediantion_fee_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_transaction",            limit: 255
  end

  create_table "perguntas_formulario_historia", force: :cascade do |t|
    t.text   "pergunta"
    t.string "url_imagem", limit: 255
  end

  create_table "pessoas_admira_usuarios", force: :cascade do |t|
    t.integer  "pessoas_admira_id", null: false
    t.integer  "user_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas_admiras", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.text     "img_id"
    t.integer  "width"
    t.integer  "height"
    t.integer  "picturable_id"
    t.string   "picturable_type", limit: 255
    t.text     "picture_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pontuacoes", force: :cascade do |t|
    t.integer  "pontos"
    t.integer  "acao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_comments", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "post_id",     null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree
  add_index "post_comments", ["user_id"], name: "index_post_comments_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "description",             null: false
    t.integer  "post_type",               null: false
    t.integer  "dream_id",                null: false
    t.integer  "user_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_id",      limit: 255
  end

  add_index "posts", ["dream_id"], name: "index_posts_on_dream_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", using: :btree
  add_index "posts_tags", ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id", using: :btree

  create_table "powerup_languages", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "powerup_languages_powerups", id: false, force: :cascade do |t|
    t.integer "powerup_id"
    t.integer "powerup_language_id"
  end

  add_index "powerup_languages_powerups", ["powerup_id", "powerup_language_id"], name: "index_power_up_lan_on_li", unique: true, using: :btree
  add_index "powerup_languages_powerups", ["powerup_language_id", "powerup_id"], name: "index_power_up_lan_on_il", unique: true, using: :btree

  create_table "powerup_styles", force: :cascade do |t|
    t.string "name",        limit: 255, null: false
    t.string "description", limit: 255
    t.string "icon",        limit: 255, null: false
  end

  create_table "powerup_styles_powerups", id: false, force: :cascade do |t|
    t.integer "powerup_id"
    t.integer "powerup_style_id"
  end

  add_index "powerup_styles_powerups", ["powerup_id", "powerup_style_id"], name: "index_power_up_styles_on_si", unique: true, using: :btree
  add_index "powerup_styles_powerups", ["powerup_style_id", "powerup_id"], name: "index_power_up_styles_on_is", unique: true, using: :btree

  create_table "powerup_types", force: :cascade do |t|
    t.string "name",        limit: 255, null: false
    t.string "description", limit: 255
    t.string "icon",        limit: 255, null: false
  end

  create_table "powerups", force: :cascade do |t|
    t.string   "name",            limit: 255,                 null: false
    t.text     "description"
    t.string   "link",            limit: 255
    t.integer  "price"
    t.integer  "user_id",                                     null: false
    t.integer  "powerup_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_authorized",               default: false
    t.text     "slug"
  end

  add_index "powerups", ["powerup_type_id"], name: "index_powerups_on_powerup_type_id", using: :btree
  add_index "powerups", ["user_id"], name: "index_powerups_on_user_id", using: :btree

  create_table "privacy_user_block_favorites", force: :cascade do |t|
    t.string  "block",   limit: 255, null: false
    t.integer "user_id",             null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reason_for_follow_dreams", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "dream_id",   null: false
    t.text     "reason",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reason_for_follow_dreams", ["dream_id"], name: "index_reason_for_follow_dreams_on_dream_id", using: :btree
  add_index "reason_for_follow_dreams", ["user_id"], name: "index_reason_for_follow_dreams_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "respostas_formulario_historia", force: :cascade do |t|
    t.text     "resposta"
    t.integer  "perguntas_formulario_historia_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publico",                          default: false, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sensor_data", force: :cascade do |t|
    t.integer  "ruido"
    t.integer  "dispositivo_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sugestoes", force: :cascade do |t|
    t.string   "origem",     limit: 255
    t.text     "sugestao"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_formulario_historia", force: :cascade do |t|
    t.string   "tag",        limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_formulario_historia_resposta", force: :cascade do |t|
    t.integer  "tags_formulario_historia_id",      null: false
    t.integer  "respostas_formulario_historia_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "bio"
    t.integer  "usr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "trofeus", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "descricao",  limit: 255
    t.string   "image_url",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trofeus_usuarios", force: :cascade do |t|
    t.integer  "trofeu_id",  null: false
    t.integer  "user_id",    null: false
    t.integer  "acao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_events", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_dreams", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "dream_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_dreams", ["dream_id"], name: "index_user_dreams_on_dream_id", using: :btree
  add_index "user_dreams", ["user_id"], name: "index_user_dreams_on_user_id", using: :btree

  create_table "user_feedback_powerups", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "powerup_id", null: false
    t.text     "feedback",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_feedback_powerups", ["powerup_id"], name: "index_user_feedback_powerups_on_powerup_id", using: :btree
  add_index "user_feedback_powerups", ["user_id"], name: "index_user_feedback_powerups_on_user_id", using: :btree

  create_table "user_like_post_comments", force: :cascade do |t|
    t.integer  "post_comment_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_like_post_comments", ["post_comment_id"], name: "index_user_like_post_comments_on_post_comment_id", using: :btree
  add_index "user_like_post_comments", ["user_id"], name: "index_user_like_post_comments_on_user_id", using: :btree

  create_table "user_like_posts", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_like_posts", ["post_id"], name: "index_user_like_posts_on_post_id", using: :btree
  add_index "user_like_posts", ["user_id"], name: "index_user_like_posts_on_user_id", using: :btree

  create_table "user_rating_powerups", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "powerup_id", null: false
    t.integer  "score",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_rating_powerups", ["powerup_id"], name: "index_user_rating_powerups_on_powerup_id", using: :btree
  add_index "user_rating_powerups", ["user_id"], name: "index_user_rating_powerups_on_user_id", using: :btree

  create_table "user_report_posts", force: :cascade do |t|
    t.integer  "report",                      null: false
    t.integer  "user_id",                     null: false
    t.integer  "post_id",                     null: false
    t.boolean  "show_in_feed", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_report_posts", ["post_id"], name: "index_user_report_posts_on_post_id", using: :btree
  add_index "user_report_posts", ["user_id"], name: "index_user_report_posts_on_user_id", using: :btree

  create_table "user_search_dream_params", force: :cascade do |t|
    t.string   "query_string",      limit: 255
    t.integer  "user_id",                       null: false
    t.integer  "dream_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_search_dream_params", ["dream_category_id"], name: "index_user_search_dream_params_on_dream_category_id", using: :btree
  add_index "user_search_dream_params", ["user_id"], name: "index_user_search_dream_params_on_user_id", using: :btree

  create_table "user_us_mails", force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.string   "address",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_viewed_dreams", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "dream_id",               null: false
    t.integer  "view_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_viewed_dreams", ["dream_id"], name: "index_user_viewed_dreams_on_dream_id", using: :btree
  add_index "user_viewed_dreams", ["user_id"], name: "index_user_viewed_dreams_on_user_id", using: :btree

  create_table "user_viewed_powerups", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "powerup_id",             null: false
    t.integer  "view_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_viewed_powerups", ["powerup_id"], name: "index_user_viewed_powerups_on_powerup_id", using: :btree
  add_index "user_viewed_powerups", ["user_id"], name: "index_user_viewed_powerups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "lastname",               limit: 255
    t.string   "cargo",                  limit: 255
    t.string   "empresa",                limit: 255
    t.string   "formacao",               limit: 255
    t.string   "local_formacao",         limit: 255
    t.text     "facebook_url"
    t.text     "twitter_url"
    t.text     "linkedin_url"
    t.text     "biografia"
    t.string   "authentication_token",   limit: 255
    t.date     "data_aniversario"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "slug",                   limit: 255
    t.string   "referral_code",          limit: 255
    t.string   "referral",               limit: 255
    t.string   "google_plus",            limit: 255
    t.string   "sex",                    limit: 255
    t.boolean  "legacy",                             default: false
    t.string   "profile_image_id",       limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "nome",           limit: 255
    t.string   "url",            limit: 255
    t.integer  "videoable_id"
    t.string   "videoable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
