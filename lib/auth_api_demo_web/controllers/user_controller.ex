defmodule AuthApiDemoWeb.UserController do
  use AuthApiDemoWeb, :controller

  alias AuthApiDemo.Accounts
  alias AuthApiDemo.Accounts.User
  alias AuthApiDemo.Guardian

  action_fallback AuthApiDemoWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("jwt.json", token: token)
    end
  end

  def show(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    conn |> render("user.json", user: user)
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    case Accounts.sign_in(email, password) do
      {:ok, token, _claims} ->
        render(conn, "jwt.json", token: token)

      _ ->
        {:error, :unauthorized}
    end
  end
end
