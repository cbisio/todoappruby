require 'rails_helper'

RSpec.describe User, typ: :model do
    
    it  'validate presence of require fields ' do
         should validate_presence_of(:name)
         should validate_presence_of(:email)
         should validate_presence_of(:password)
    end

end