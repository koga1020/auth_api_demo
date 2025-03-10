defmodule AuthApiDemoWeb.Router do
  use AuthApiDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :require_authenticated do
    plug AuthApiDemoWeb.Plug.AuthPipeline
  end

  scope "/api", AuthApiDemoWeb do
    pipe_through :api
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: AuthApiDemoWeb.Telemetry
    end
  end

  scope "/", AuthApiDemoWeb do
    pipe_through :api

    post "/sign-up", UserController, :create
    post "/sign-in", UserController, :sign_in
  end

  scope "/", AuthApiDemoWeb do
    pipe_through [:api, :require_authenticated]

    get "/whoami", UserController, :show
  end
end
