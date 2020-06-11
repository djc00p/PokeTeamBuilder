require 'rails_helper'

RSpec.describe AttacksPokemon, type: :model do
  describe "Relationships" do
    it { should belong_to :attack}
    it { should belong_to :pokemon}
  end
end
