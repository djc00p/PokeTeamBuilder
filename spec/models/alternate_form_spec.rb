require 'rails_helper'

RSpec.describe AlternateForm, type: :model do
  describe "Validations" do
    it { should validate_presence_of :dex_number }
    it { should validate_presence_of :name }
    it { should validate_presence_of :type_1 }
    it { should validate_presence_of :type_2 }
    it { should validate_presence_of :ability_1 }
    it { should validate_presence_of :ability_2 }
    it { should validate_presence_of :ability_3 }
    it { should validate_presence_of :ability_4 }
    it { should validate_numericality_of :hp}
    it { should validate_numericality_of :defense }
    it { should validate_numericality_of :attack }
    it { should validate_numericality_of :special_attack }
    it { should validate_numericality_of :special_defense }
    it { should validate_numericality_of :speed}
    it { should validate_presence_of :image_url}
  end

  describe "Relationships" do
    it {should have_many :ability_alternate_forms}
    it {should have_many(:abilities).through :ability_alternate_forms}
  end
end
