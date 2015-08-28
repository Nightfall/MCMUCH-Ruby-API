class APIv1 < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :development do
        use BetterErrors::Middleware
        BetterErrors.application_root = __dir__
    end

    get "/" do
        throw "test"
    end
end
