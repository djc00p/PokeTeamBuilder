require 'rails_helper'

RSpec.describe AbilityPokemon, type: :model do
  describe "Relationships" do
    it { should belong_to :ability}
    it { should belong_to :pokemon}
  end
end
