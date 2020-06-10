require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :game_description }
    it { should validate_presence_of :serebii_in_depth_description }
  end

  describe "Relationships" do
    it {should have_many :abilities_alternate_forms}
    it {should have_many(:alternate_forms).through :abilities_alternate_forms}
    it {should have_many :abilities_pokemons}
    it {should have_many(:pokemons).through :abilities_pokemons}
  end
end
