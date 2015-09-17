Configuration.new do
  jackal do
    require [
      'carnivore-http',
      'carnivore-actor',
      'jackal-github',
      'jackal-code-fetcher',
      'custom-short-example'
    ]
    assets do
      bucket 'jackal-assets'
      connection do
        provider 'local'
        credentials.object_store_root '/tmp/jackal'
      end
    end
    github do
      sources do
        input do
          type :http_paths
          args do
            port 9999
            path '/github'
            method 'post'
          end
        end
        output do
          type :actor
          args.remote_name :jackal_code_fetcher_input
        end
      end
      callbacks [
        'Jackal::Github::Eventer'
      ]
      formatters [
        'Jackal::Github::Formatter::CodeFetcher'
      ]
    end
    code_fetcher do
      sources do
        input do
          type :actor
        end
        output do
          type :actor
          args.remote_name :custom_short_example_input
        end
      end
      callbacks [
        'Jackal::CodeFetcher::GitHub'
      ]
    end
  end
  custom_short.example do
    config.notification_url NOTIFICATION_URL
    sources.input do
      type :actor
    end
    callbacks [
      'CustomShort::Example::Runner'
    ]
  end

end
