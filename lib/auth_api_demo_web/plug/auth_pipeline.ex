defmodule AuthApiDemoWeb.Plug.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :auth_api_demo,
    module: AuthApiDemo.Guardian,
    error_handler: AuthApiDemoWeb.Plug.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
