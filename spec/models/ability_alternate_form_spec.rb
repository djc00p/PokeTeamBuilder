require 'rails_helper'

RSpec.describe AbilityAlternateForm, type: :model do
  describe "Relationships" do
    it { should belong_to :ability}
    it { should belong_to :alternate_form}
  end
end
