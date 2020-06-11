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
    CSV.foreach('./db/Gen_8/AttackDex/otherdex.csv', headers: true, :header_converters => lambda { |h| h.try(:downcase) }) do |row|
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
    CSV.foreach('./db/Gen_8/AttackDex/physicaldex.csv', headers: true, :header_converters => lambda { |h| h.try(:downcase) }) do |row|
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
    CSV.foreach('./db/Gen_8/AttackDex/specialdex.csv', headers: true, :header_converters => lambda { |h| h.try(:downcase) }) do |row|
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

  # desc "Import Natures from CSV file"
  # task customer: :environment do
  #   require 'csv'
  #   count = 0
  #   CSV.foreach('./db/Gen_8/AbilityDex/AbilityDex.csv', headers: true) do |row|
  #     Customer.create!(row.to_h)
  #     count += 1
  #   end
  #   puts "Imported #{count} Customers"
  # end

    #
    # desc "Import Alt Forms from CSV file"
    # task customer: :environment do
    #   require 'csv'
    #   count = 0
    #   CSV.foreach('./db/Gen_8/AbilityDex/AbilityDex.csv', headers: true) do |row|
    #     Customer.create!(row.to_h)
    #     count += 1
    #   end
    #   puts "Imported #{count} Customers"
    # end
    #
    # desc "Import Pokemon from CSV file"
    # task customer: :environment do
    #   require 'csv'
    #   count = 0
    #   CSV.foreach('./db/Gen_8/AbilityDex/AbilityDex.csv', headers: true) do |row|
    #     Customer.create!(row.to_h)
    #     count += 1
    #   end
    #   puts "Imported #{count} Customers"
    # end


  task :all => [:ability, :attack]
end