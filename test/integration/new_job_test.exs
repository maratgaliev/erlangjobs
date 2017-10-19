defmodule Erlangjobs.NewJobTest do
  use Erlangjobs.IntegrationCase

  def jobs_index do
    job_url(ErlangjobsWeb.Endpoint, :index)
  end

  @tag :integration
  test "GET /jobs/new and add job" do
    jobs_index() |> navigate_to()

    click({:id, "add_job"})

    assert element_displayed?({:id, "add_job_form"})

    new_job_form = find_element(:id, "add_job_form")

    new_job_form
    |> find_within_element(:id, "job_title")
    |> fill_field("Elixir Job")

    execute_script("$('#body-editor').nextAll('.CodeMirror')[0].CodeMirror.getDoc().setValue('Lorem Ipsum');")

    new_job_form
    |> find_within_element(:id, "job_city")
    |> fill_field("Kazan")

    new_job_form
    |> find_within_element(:id, "job_company")
    |> fill_field("SmartApps")

    new_job_form
    |> find_within_element(:id, "job_email")
    |> fill_field("job@jobs.com")

    new_job_form
    |> find_within_element(:id, "job_site")
    |> fill_field("http://www.site.com")

    new_job_form
    |> find_within_element(:css, "button")
    |> click

    assert element_displayed?({:css, ".alert.alert-info"})
  end

  @tag :integration
  test "GET /jobs/new and add invalid job" do

    jobs_index() |> navigate_to()

    click({:id, "add_job"})

    assert element_displayed?({:id, "add_job_form"})

    new_job_form = find_element(:id, "add_job_form")

    new_job_form
    |> find_within_element(:id, "job_title")
    |> fill_field("New Job")

    new_job_form
    |> find_within_element(:css, "button")
    |> click

    assert element_displayed?({:css, ".alert.alert-danger"})

  end

end