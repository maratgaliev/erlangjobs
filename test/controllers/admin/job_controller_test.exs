# defmodule Erlangjobs.Admin.JobControllerTest do
#   use ErlangjobsWeb.ConnCase
#   import Erlangjobs.Factory
#   alias Erlangjobs.Offers.Job
  
#   @valid_attrs %{title: "some title"}
#   @invalid_attrs %{}

#   setup do
#     job = insert(:job)
#     {:ok, conn: build_conn(), job: job}
#   end

#   @username Application.get_env(:basic_auth, :auth_config)[:username]
#   @password Application.get_env(:basic_auth, :auth_config)[:password]

#   defp using_basic_auth(conn, username, password) do
#     header_content = "Basic " <> Base.encode64("#{username}:#{password}")
#     conn |> put_req_header("authorization", header_content)
#   end

#   test "lists all entries on index", %{conn: conn} do
#     conn = conn
#     |> using_basic_auth(@username, @password)
#     |> get admin_job_path(conn, :index)
#     assert html_response(conn, 200) =~ "Delete"
#   end

#   test "shows chosen resource", %{conn: conn} do
#     job = Repo.insert! %Job{}
#     conn = get conn, admin_job_path(conn, :show, job)
#     assert html_response(conn, 200) =~ "Show job"
#   end

#   test "renders page not found when id is nonexistent", %{conn: conn} do
#     assert_error_sent 404, fn ->
#       get conn, admin_job_path(conn, :show, "-1-test")
#     end
#   end

#   test "renders form for editing chosen resource", %{conn: conn} do
#     job = Repo.insert! %Job{}
#     conn = get conn, admin_job_path(conn, :edit, job)
#     assert html_response(conn, 200) =~ "Edit job"
#   end

#   test "updates chosen resource and redirects when data is valid", %{conn: conn} do
#     job = Repo.insert! %Job{}
#     conn = put conn, admin_job_path(conn, :update, job), job: @valid_attrs
#     assert redirected_to(conn) == admin_job_path(conn, :show, job)
#     assert Repo.get_by(Job, @valid_attrs)
#   end

#   test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
#     job = Repo.insert! %Job{}
#     conn = put conn, admin_job_path(conn, :update, job), job: @invalid_attrs
#     assert html_response(conn, 200) =~ "Edit job"
#   end

#   test "deletes chosen resource", %{conn: conn} do
#     job = Repo.insert! %Job{}
#     conn = delete conn, admin_job_path(conn, :delete, job)
#     assert redirected_to(conn) == admin_job_path(conn, :index)
#     refute Repo.get(Job, job.id)
#   end
# end
