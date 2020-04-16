require 'rails_helper'

RSpec.describe Todo, type: :model do
    it { should belong_to(:user)}
    it { should have_many(:tasks).dependent(:destroy)}
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:created_by)}
end