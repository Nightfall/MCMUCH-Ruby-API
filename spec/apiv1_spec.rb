require "spec_helper"

describe APIv1 do
  def app
    APIv1
  end

  def add_testuser
    put "/users", {
      "username": "TestUser",
      "uuid": "ayy lmao"
    }.to_json
  end

  it "lets me add content" do
    add_testuser
    put "/content", {
      "sha1": "3f786850e387550fdab836ed7e6dc881de23001b",
      "name": "Test Content",
      "type": "test",
      "user": "TestUser"
    }.to_json

    puts Content.all.to_json
  end
end
