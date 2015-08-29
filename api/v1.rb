require "digest/sha1"

class APIv1 < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__

    register Sinatra::Reloader
  end

  before do
    request.body.rewind
    @body = request.body.read
    @json = JSON.parse @body if @body.size > 0
  end

  get "/content/:name_or_sha1" do |name_or_sha1|
    if name_or_sha1 =~ /[0-9a-f]{40}/
      Content.get(name_or_sha1).to_json
    else
      Content.find_by(name: name_or_sha1).to_json
    end
  end

  get "/content/by_user/:user" do |user|
    Content.where(user: user).to_json
  end

  get "/content" do
    Content.all.to_json
  end

  put "/content" do
    Content.new(@json).save!.to_json
  end

  get "/users" do
    User.all.to_json
  end

  get "/users/:id" do |id|
    User.find_by(id: id.to_i).to_json
  end

  put "/users" do
    User.new(@json).save!.to_json
  end
end
