namespace :import do
  desc "Import Abilities from CSV file"
  task ability: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/Gen_8/AbilityDex/AbilityDex.csv', headers: true) do |row|
      Ability.create!(row.to_h)
      count += 1
    end
    puts "Imported #{count} Gen 8 Abilities"
  end

  desc "Import Attacks from CSV file"
  task attack: :environment do
    require 'csv'

    other_count = 0
    physical_count = 0
    special_count = 0

    # Other Attacks
    CSV.foreach('./db/Gen_8/AttackDex/otherdex.csv', headers: true) do |row|
      Attack.create!(
        {
          name: row["name"],
          move_type: "other",
          pp: row["pp"],
          attack: row["attack"],
          accuracy: row["accuracy"],
          effect: row["effect"],
          attack_type: row["attack_type"],
          move_type_img: "https://www.serebii.net/pokedex-bw/type/other.png"
        }
      )
      other_count += 1
    end
    puts "Imported #{other_count} Gen 8 Other Attacks"

    # Physical Attacks
    CSV.foreach('./db/Gen_8/AttackDex/physicaldex.csv', headers: true) do |row|
      Attack.create!(
        {
          name: row["name"],
          move_type: "physical",
          pp: row["pp"],
          attack: row["attack"],
          accuracy: row["accuracy"],
          effect: row["effect"],
          attack_type: row["attack_type"],
          move_type_img: "https://www.serebii.net/pokedex-bw/type/physical.png"
        }
      )
      physical_count += 1
    end
    puts "Imported #{physical_count} Gen 8 Physical Attacks"

    # Special Attacks
    CSV.foreach('./db/Gen_8/AttackDex/specialdex.csv', headers: true) do |row|
      Attack.create!(
        {
          name: row["name"],
          move_type: "special",
          pp: row["pp"],
          attack: row["attack"],
          accuracy: row["accuracy"],
          effect: row["effect"],
          attack_type: row["attack_type"],
          move_type_img: "https://www.serebii.net/pokedex-bw/type/special.png"
        }
      )
      special_count += 1
    end
    puts "Imported #{special_count} Gen 8 Special Attacks"

  end

  desc "Import Items from CSV file"
  task item: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/Gen_8/ItemDex/HeldItems.csv', headers: true) do |row|
      Item.create!(row.to_h)
      count += 1
    end
    puts "Imported #{count} Gen 8 Items"
  end

  desc "Import Natures from CSV file"
  task nature: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/Gen_8/Nature/NatureDex.csv', headers: true) do |row|
      Nature.create!(row.to_h)
      count += 1
    end
    puts "Imported #{count} Gen 8 Natures"
  end


  desc "Import Pokemons from CSV file"
  task pokemon: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/Gen_8/Galar_Pokedex/GalarDex.csv', headers: true) do |row|
      mon = Pokemon.create!(
        pokedex_number: row["pokedex_number"],
        name: row["name"],
        type_1: row["type_1"],
        type_2: row["type_2"],
        ability_1: row["ability_1"],
        ability_2: row["ability_2"],
        ability_3: row["ability_3"],
        ability_4: row["ability_4"],
        hp: row["hp"],
        defense: row["defense"],
        attack: row["attack"],
        special_attack: row["special_attack"],
        special_defense: row["special_defense"],
        speed: row["speed"],
        image_url: row["image_url"]
      )
      count += 1
      abilities_jointables(mon, "og")
      attacks_jointables(mon, "og")
    end
    puts "Imported #{count} Gen 8 Galar Pokedex entries"
  end

  desc "Import AlternateForms from CSV file"
  task alternate_form: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/Gen_8/Galar_Pokedex/GalarDexAlternateForms.csv', headers: true) do |row|
      mon = AlternateForm.create!(
        pokedex_number: row["pokedex_number"],
        name: row["name"],
        type_1: row["type_1"],
        type_2: row["type_2"],
        ability_1: row["ability_1"],
        ability_2: row["ability_2"],
        ability_3: row["ability_3"],
        ability_4: row["ability_4"],
        hp: row["hp"],
        defense: row["defense"],
        attack: row["attack"],
        special_attack: row["special_attack"],
        special_defense: row["special_defense"],
        speed: row["speed"],
        image_url: row["image_url"],
        pokemon_id: Pokemon.find_by(pokedex_number: row["pokedex_number"]).id
      )
      count += 1
      abilities_jointables(mon, "alt")
      attacks_jointables(mon, "alt")
    end

    puts "Imported #{count} Gen 8 Galar Pokedex Alternate Forms entries"
  end

  def abilities_jointables(pokemon, form)
    if pokemon.ability_4 != "null"
      create_abilities_pokemon(pokemon.ability_4, pokemon, form)
      create_abilities_pokemon(pokemon.ability_3, pokemon, form)
      create_abilities_pokemon(pokemon.ability_2, pokemon, form)
      create_abilities_pokemon(pokemon.ability_1, pokemon, form)
      puts "Created 4 AbilitiesPokemon for #{pokemon.name}"
    elsif pokemon.ability_3 != "null"
      create_abilities_pokemon(pokemon.ability_3, pokemon, form)
      create_abilities_pokemon(pokemon.ability_2, pokemon, form)
      create_abilities_pokemon(pokemon.ability_1, pokemon, form)
      puts "Created 3 AbilitiesPokemon for #{pokemon.name}"
    elsif pokemon.ability_2 != "null"
      create_abilities_pokemon(pokemon.ability_2, pokemon, form)
      create_abilities_pokemon(pokemon.ability_1, pokemon, form)
      puts "Created 2 AbilitiesPokemon for #{pokemon.name}"
    else
      create_abilities_pokemon(pokemon.ability_1, pokemon, form)
      puts "Created 1 AbilitiesPokemon for #{pokemon.name}"
    end
  end

  def create_abilities_pokemon(ability, pokemon, form)
    if form == "og"
      AbilitiesPokemon.create!(
        {
          ability_id: Ability.find_by(name: ability).id,
          pokemon_id: pokemon.id
        }
      )
    else
      AbilitiesAlternateForm.create!(
        {
          ability_id: Ability.find_by(name: ability).id,
          alternate_form_id: pokemon.id
        }
      )
    end
  end

  def attacks_jointables(pokemon, form)
    pokemon_attack_data = JSON.parse(File.read('./db/Gen_8/PokemonAttacks/pokemon_attack_data.json'))
    pokemon_attack_data.each do |data|
      gform_count = 0
      if data["name"] == pokemon.name
        data.each do |key, value|
          next if key == "name"
          next if (gform_count == 1 && key == "Standard Level Up")
          if (form == "og" && key == "Galarian Form Level Up")
            value.each do |attack|
              create_attacks_pokemon(pokemon.id, attack, form)
            end
            gform_count += 1
          elsif (form == "alt" && key == "Galarian Form Level Up")
            next
          else
            value.each do |attack|
              create_attacks_pokemon(pokemon.id, attack, form)
            end
          end
        end
      end
    end
  end

  def create_attacks_pokemon(pokemon_id, attack, form)
    if form == "og"
      AttacksPokemon.create!(
        {
          attack_id: Attack.find_by(name: attack).id,
          pokemon_id: pokemon_id
        }
      )
    else
      AlternateFormsAttack.create!(
        {
          alternate_form_id: pokemon_id,
          attack_id: Attack.find_by(name: attack).id
        }
      )
    end
  end

  task :all => [:ability, :attack, :item, :nature, :pokemon, :alternate_form]
end
