defmodule ErlangjobsWeb do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Erlangjobs.Web, :controller
      use Erlangjobs.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema
      use Timex.Ecto.Timestamps, usec: true

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end
  
  def controller do
    quote do
      use Phoenix.Controller, namespace: ErlangjobsWeb

      alias Erlangjobs.Repo
      import Ecto
      import Ecto.Query

      import ErlangjobsWeb.Router.Helpers
      import ErlangjobsWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/erlangjobs_web/templates", namespace: ErlangjobsWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, get_flash: 1, view_module: 1, action_name: 1, controller_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import ErlangjobsWeb.Router.Helpers
      import ErlangjobsWeb.ErrorHelpers
      import ErlangjobsWeb.Gettext
      def render_shared(template, assigns \\ []) do
        render(ErlangjobsWeb.SharedView, template, assigns)
      end

      import ErlangjobsWeb.UtilHelpers
    end


  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Erlangjobs.Repo
      import Ecto
      import Ecto.Query
      import ErlangjobsWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
