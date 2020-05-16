defmodule AuthApiDemo.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_password_hash()
    |> unique_constraint(:email)
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: pass}} = changeset) do
    put_change(changeset, :password_hash, Argon2.hash_pwd_salt(pass))
  end

  defp put_password_hash(changeset), do: changeset
end
