require 'twitter'

namespace :twitter do
    desc "ツイートする"
    task :tweet => :environment do
        ## アプリ登録時に取得したCONSUMER_KEY/CONSUMER_SECRET
        CONSUMER_KEY = 'IFkWVxAS4iGJp3BaV3p2wdyvY'
        CONSUMER_SECRET = 'Cgz4De03o7H1Mj6uKv0Ws1ppFN75p66EZNRwbSnLSPW7KDZVLy'
        ## irbで取得したAccess Token/Access Secret
        OAUTH_TOKEN = '219966877-bpfZ6LdrdBYpsa0xEV9B61fKYQY4T1zzL7e2R3dl'
        OAUTH_TOKEN_SECRET = 'qLXR04e5xGQl44EAuQSAxy3zVKnN0yHtzIGUgXxRLWmmc'

        Twitter.configure do |config|
          config.consumer_key       = CONSUMER_KEY
          config.consumer_secret    = CONSUMER_SECRET
          config.oauth_token        = OAUTH_TOKEN
          config.oauth_token_secret = OAUTH_TOKEN_SECRET
        end

      tweet = "テストツイートですのののの"
        update(tweet)
    end

    def update(tweet)
        begin
            tweet = (tweet.length > 140) ? tweet[0..139].to_s : tweet
            Twitter.update(tweet.chomp)
        rescue => e
            Rails.logger.error "<<twitter.rake::tweet.update ERROR : #{e.message}>>"
        end
    end
end