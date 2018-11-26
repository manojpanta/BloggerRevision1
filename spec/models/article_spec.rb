require 'rails_helper'

describe Article, type: :model do
  it {should have_many(:comments)}
  it{ should validate_presence_of (:title)}
  it{ should validate_presence_of (:body)}
end
