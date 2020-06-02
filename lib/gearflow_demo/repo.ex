defmodule GearflowDemo.Repo do
  use Ecto.Repo,
    otp_app: :gearflow_demo,
    adapter: Ecto.Adapters.Postgres
end
