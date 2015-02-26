
require 'rails_helper'

describe Organization do

  it "validates the presence of the name" do
  organization = Organization.new(name: "Joe")
  expect(organization).to be_valid
  end

  it "is invalid without the name" do
  organization = Organization.new(name: nil)
  organization.valid?
  expect(organization.errors[:name]).to include("can't be blank")
  end


  it "validates the uniqueness of the name" do
  Organization.create(
  name: 'Joe'
  )

  organization = Organization.create(
  name: 'Joe'
  )
  organization.valid?
  expect(organization.errors[:name]).to include("has already been taken")
  end
end
