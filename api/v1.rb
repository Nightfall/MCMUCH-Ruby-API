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

    get "/content" do
        Content.all.to_json
    end

    put "/content" do
        c = Content.new @json
        c.save!
    end
end
