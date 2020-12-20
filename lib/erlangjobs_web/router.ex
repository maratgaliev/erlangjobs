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
    pipe_through :browser
    
    resources "/jobs", JobController, only: [:index, :new, :create, :show]
    resources "/events", EventController, only: [:index, :new, :create, :show]
    resources "/resources", ResourceController, only: [:index]

    get "/", JobController, :index
    get "/feed", JobController, :feed, as: :feed
    get "/search", SearchController, :index
    get "/about", PageController, :about
    get "/contacts", PageController, :contacts
    get "/rules", PageController, :rules
  end

  pipeline :admin do
    plug BasicAuth, use_config: {:basic_auth, :auth_config}
  end

  scope "/admin", as: :admin do
    pipe_through [:browser, :admin]
    resources "/jobs", ErlangjobsWeb.Admin.JobController, only: [:index, :show, :edit, :update, :delete]
    resources "/events", ErlangjobsWeb.Admin.EventController, only: [:index, :edit, :update, :delete]
    resources "/resources", ErlangjobsWeb.Admin.ResourceController, only: [:index, :edit, :update, :delete, :new, :create]
  end
end
