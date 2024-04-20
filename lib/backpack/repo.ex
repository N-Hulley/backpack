defmodule Backpack.Repo do
  use Ecto.Repo,
    otp_app: :backpack,
    adapter: Ecto.Adapters.Postgres
end
