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
  
  task :all => [:ability]
end
