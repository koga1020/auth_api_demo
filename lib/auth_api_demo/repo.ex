defmodule AuthApiDemo.Repo do
  use Ecto.Repo,
    otp_app: :auth_api_demo,
    adapter: Ecto.Adapters.Postgres
end
