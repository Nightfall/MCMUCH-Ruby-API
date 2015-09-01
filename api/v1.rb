class APIv1 < Grape::API
  version :v1, using: :path
  format :json
  rescue_from :all unless ENV["RACK_ENV"] == "test"

  resource :content do
    get ":sha1" do
      Content.get(name_or_sha1).as_json
    end

    get "by_user/:user" do |user|
      Content.where(user: user).as_json
    end

    get do
      Content.all.as_json
    end

    put do
      c = Content.new(@json)
      c.save!
      c.as_json
    end
  end

  resource :users do
    get do
      User.all.as_json
    end

    get ":id" do |id|
      User.find_by(id: id.to_i).as_json
    end

    put do
      u = User.new(@json)
      u.save!
      u.as_json
    end
  end
end
