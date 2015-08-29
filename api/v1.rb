require 'digest/sha1'

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

  get "/content/name=:name" do |name|
    Content.where(name: name).to_json
  end


  get "/content/user=:user" do |user|
    Content.where(user: user).to_json
  end

  get "/content" do
    Content.all.to_json
  end

  put "/content/:uuid" do |uuid|
    if User.auth(@json['user_id'], uuid) then
      Content.new(@json).save!
    else
      halt 401
    end
  end

  get "/user" do
    User.all.to_json
  end

  get "/user/:id" do |id|
    User.find_by(id: id.to_i).to_json
  end

  put "/user/:uuid" do |uuid|
    hashed = User.sha1(uuid)
    @json['uuid_hash'] = hashed[0]
    @json['salt'] = hashed[1]
    User.new(@json).save!.to_json
  end
end
