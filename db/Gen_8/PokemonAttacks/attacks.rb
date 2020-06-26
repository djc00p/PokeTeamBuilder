require 'open-uri'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

pokemon= []
count = 0

CSV.foreach('./db/Gen_8/PokemonAttacks/Query_Results.csv', headers: true) do |poke|
  url = "https://www.serebii.net/pokedex-swsh/#{poke['name'].downcase.delete(' ')}/#attacks"
  base_url = 'https://www.serebii.net'

  html = URI.open(url)

  doc = Nokogiri::HTML(html) do |config|
    config.strict.noblanks
  end

  pokemon.push(name: poke['name'])

  doc.search( '#content .dextable' ).drop(8).each do |table|
    catagories = ["Galarian Form Level Up","Standard Level Up","Technical Machine Attacks","Technical Record Attacks","Egg Moves","Move Tutor","Isle of Armor Move Tutor Attacks","Usable Max Moves","Special Moves"]

    next if !catagories.include?("#{table.children[0].children[0].text}" || "#{table.children[0].children[0].children[1].children[0].text}")

    attacks = []
    table.search('tr').drop(2).each do |tr|
      next if tr.children[2].nil?
      if tr.children[2].children[0].children.text == ""
        next if (tr.children[0].children[0].children.text == "")
        attack = tr.children[0].children[0].children.text
        attacks.push(attack)
      else
        attack = tr.children[2].children[0].children.text
        attacks.push(attack)
      end
    end

    if table.children[0].children[0].children[1].nil?
      pokemon.last["#{table.children[0].children[0].text}"] = attacks
    else
      pokemon.last["#{table.children[0].children[0].children[1].children[0].text}"] = attacks
    end
  end

  puts "Created #{poke['name']} attacks"
end

json = JSON.pretty_generate(pokemon)
File.write("./db/Gen_8/PokemonAttacks/pokemon_attack_data.json", json)
