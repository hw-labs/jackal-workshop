Configuration.new do
  jackal do
    require [
      'carnivore-http',
      'carnivore-actor',
      'jackal-github',
      'jackal-code-fetcher'
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
      end
      callbacks [
        'Jackal::CodeFetcher::GitHub'
      ]
    end
  end
end
