defmodule ErlangjobsWeb.Router do
  use ErlangjobsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ErlangjobsWeb do
    pipe_through :browser # Use the default browser stack
    resources "/jobs", JobController, only: [:index, :new, :create]

    get "/", JobController, :index

    get "/about", PageController, :about
    get "/contacts", PageController, :contacts
    get "/rules", PageController, :rules

    get "/feed", FeedController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Erlangjobs do
  #   pipe_through :api
  # end
end
