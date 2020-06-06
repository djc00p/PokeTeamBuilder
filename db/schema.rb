# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_06_193718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.text "game_description"
    t.text "serebii_in_depth_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "abilities_pokemons", id: false, force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "ability_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_id", "pokemon_id"], name: "index_abilities_pokemons_on_ability_id_and_pokemon_id"
    t.index ["pokemon_id", "ability_id"], name: "index_abilities_pokemons_on_pokemon_id_and_ability_id"
  end

  create_table "alternate_forms", force: :cascade do |t|
    t.string "pokedex_number"
    t.string "name"
    t.string "type_1"
    t.string "type_2"
    t.string "ability_1"
    t.string "ability_2"
    t.string "ability_3"
    t.string "ability_4"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "special_attack"
    t.integer "special_defense"
    t.integer "speed"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "pp"
    t.string "attack"
    t.integer "accuracy"
    t.text "effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attacks_pokemons", id: false, force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "attack_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attack_id", "pokemon_id"], name: "index_attacks_pokemons_on_attack_id_and_pokemon_id"
    t.index ["pokemon_id", "attack_id"], name: "index_attacks_pokemons_on_pokemon_id_and_attack_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "type"
    t.string "image_url"
    t.string "name"
    t.text "effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string "nature"
    t.string "increases"
    t.string "decreases"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "natures_pokemons", id: false, force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "nature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nature_id", "pokemon_id"], name: "index_natures_pokemons_on_nature_id_and_pokemon_id"
    t.index ["pokemon_id", "nature_id"], name: "index_natures_pokemons_on_pokemon_id_and_nature_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "pokedex_number"
    t.string "name"
    t.string "type_1"
    t.string "type_2"
    t.string "ability_1"
    t.string "ability_2"
    t.string "ability_3"
    t.string "ability_4"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "special_attack"
    t.integer "special_defense"
    t.integer "speed"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
