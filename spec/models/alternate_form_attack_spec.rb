require 'rails_helper'

RSpec.describe AlternateFormsAttack, type: :model do
  describe "Relationships" do
    it { should belong_to :attack}
    it { should belong_to :alternate_form}
  end
end
