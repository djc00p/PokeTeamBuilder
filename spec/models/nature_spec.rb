require 'rails_helper'

RSpec.describe Nature, type: :model do
  describe "Validations" do
    it { should validate_presence_of :nature }
    it { should validate_presence_of :increases }
    it { should validate_presence_of :decreases }
  end
end
