defmodule AuthApiDemoWeb.UserView do
  use AuthApiDemoWeb, :view
  alias AuthApiDemoWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("jwt.json", %{token: token}) do
    %{jwt: token}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, email: user.email, password_hash: user.password_hash}
  end
end
