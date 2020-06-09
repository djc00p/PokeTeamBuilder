require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :game_despcription }
    it { should validate_presence_of :serebii_in_depth_description }
  end
end
