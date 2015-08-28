class APIv1 < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :development do
        use BetterErrors::Middleware
        BetterErrors.application_root = __dir__

        register Sinatra::Reloader
    end

    get "/" do
        throw "test"
    end
end
