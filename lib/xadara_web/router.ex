defmodule XadaraWeb.Router do
  use XadaraWeb, :router

  pipeline :api do
    plug XadaraWeb.Plugs.RateLimiter
    plug :accepts, ["json"]
  end

  # localhost:4000/api/{route}
  scope "/api", XadaraWeb do
    pipe_through :api

    get "/random", RandomController, :index
    get "/qr/:url", QRCodeController, :index
    get "/ip", IPController, :index
    get "/disposable", DisposableController, :index
    get "/epoch", EpochController, :index
  end
end
