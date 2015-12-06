# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenixcast, Phoenixcast.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "BxoAoxbV5TF2SRkYb6Qmg4FYWGFvcIqoH4KsqwrUsLfvBu1Grl6Ac4nFguR9CwOJ",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Phoenixcast.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :admin_basic_auth, realm: "Admin Area",
                          username: (System.get_env("ADMIN_USERNAME") || "admin"),
                          password: (System.get_env("ADMIN_PASSWORD") || "secret")

config :youtube, api_key: (System.get_env("YOUTUBE_API_KEY") || "youtube_api_key")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
