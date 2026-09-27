require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with an email" do
    expect(User.new(email: "a@example.com")).to be_valid
  end

  it "requires an email" do
    expect(User.new(email: nil)).not_to be_valid
  end

  it "requires a unique email" do
    User.create!(email: "a@example.com")

    expect(User.new(email: "a@example.com")).not_to be_valid
  end
end
