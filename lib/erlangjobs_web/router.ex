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
    resources "/jobs", ErlangjobsWeb.JobController, only: [:index, :new, :create, :show]

    get "/", JobController, :index
    get "/feed", JobController, :feed

    get "/about", PageController, :about
    get "/contacts", PageController, :contacts
    get "/rules", PageController, :rules
  end

  pipeline :admin do
    plug BasicAuth, use_config: {:basic_auth, :auth_config}
  end

  scope "/admin", as: :admin do
    pipe_through [:browser, :admin]
    resources "/jobs", ErlangjobsWeb.Admin.JobController, only: [:index, :edit, :update, :show, :delete]
  end


  # Other scopes may use custom stacks.
  # scope "/api", Erlangjobs do
  #   pipe_through :api
  # end
end
