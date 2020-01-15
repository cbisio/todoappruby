require 'rails_helper'

RSpec.describe User, typ: :model do
    #Associacio
    it { should have_many(:todos)}
    it  'validate presence of require fields ' do
         should validate_presence_of(:name)
         should validate_presence_of(:email)
         should validate_presence_of(:password_digest)

    end
    it { should have_secure_password}

end