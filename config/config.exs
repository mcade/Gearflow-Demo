# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gearflow_demo,
  ecto_repos: [GearflowDemo.Repo]

# Configures the endpoint
config :gearflow_demo, GearflowDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J2fuEVsSPnu3YHcZ+yuS0WK67hIH7sxE1AQ0O8nJqVyiJGnzcvHIlmIN5JzCOnDb",
  render_errors: [view: GearflowDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GearflowDemo.PubSub,
  live_view: [signing_salt: "RCtfXZrt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
