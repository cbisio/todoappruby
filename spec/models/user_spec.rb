require 'rails_helper'

RSpec.describe User, typ: :model do
    
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}

end