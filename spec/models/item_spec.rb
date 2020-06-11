require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Validations" do
    it { should validate_presence_of :type }
    it { should validate_presence_of :image_url }
    it { should validate_presence_of :name }
    it { should validate_presence_of :effect }
  end
end
