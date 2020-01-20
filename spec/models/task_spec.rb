require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to(:todo)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:done)}
end