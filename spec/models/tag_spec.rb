require 'rails_helper'

describe Tag, type: :model do
  it{ should have_many (:taggings)}

  it{should have_many(:articles).through(:taggings)}
  #having space after have many will fail this test
end
