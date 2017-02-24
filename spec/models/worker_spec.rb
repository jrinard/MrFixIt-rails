require 'rails_helper'

# unit testing spec
describe Job do
  it { should validate_presence_of :title }
end
