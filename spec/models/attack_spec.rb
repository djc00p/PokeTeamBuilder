require 'rails_helper'

RSpec.describe Attack, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :type }
    it { should validate_presence_of :pp }
    it { should validate_presence_of :attack }
    it { should validate_presence_of :accuracy }
    it { should validate_presence_of :effect }
    it { should validate_presence_of :attack_type }
    it { should validate_presence_of :type_img }
  end
end