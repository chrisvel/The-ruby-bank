require 'user'

describe User do
  it "is valid with a firstname, lastname and email" do
  it "is invalid without a firstname" do
  it "is invalid without a lastname" do
  it "is invalid without an email address" do
  it "is invalid with a duplicate email address" do
  it "returns a contact's full name as a string" do
end
