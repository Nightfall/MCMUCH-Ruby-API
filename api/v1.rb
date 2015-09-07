class APIv1 < Grape::API
  format :json
  rescue_from :all if ENV["RACK_ENV"] == "production"

  resource :users do
    get do
      User.all.as_json
    end

    get ":id" do
      User.find(params[:id]).as_json
    end

    put ":id" do
      u = User.find params[:id]

      u.username = params[:username]

      u.save!
    end
  end

  resource :creations do
    get do
      Creation.all.as_json
    end

    get ":id" do
      Creation.find(params[:id]).as_json
    end

    get ":id/comments" do
      c = Creation.find(params[:id])
      c.comments.arrange_serializable.map { |h| h.delete_recursive("parent") }
    end
  end

  resource :revisions do
    get ":sha1" do
      Revision.find_by!(sha1: params[:sha1]).as_json
    end

    get "by_user/:user" do |user|
      Revision.where(user: user).as_json
    end

    get do
      Revision.all.as_json
    end

    put do
      c = Revision.new(@json)
      c.save!
      c.as_json
    end
  end
end
