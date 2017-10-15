defmodule ErlangjobsWeb.JobViewTest do
  use ErlangjobsWeb.ConnCase, async: true

  alias ErlangjobsWeb.JobView

  test "date_format_rfc1123/1" do
    datetime = ~N[2017-10-06 22:13:01.819041]
    result = JobView.date_format_rfc1123(datetime)
    assert "Fri, 06 Oct 2017 22:13:01 +0000" = result
  end

  test "job_link/1" do
    result = JobView.job_link(1)
    assert "http://localhost:4001/#job_1" = result
  end
end
