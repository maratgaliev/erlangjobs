defmodule ErlangjobsWeb.JobViewTest do
  use ErlangjobsWeb.ConnCase, async: true

  alias ErlangjobsWeb.JobView

  test "date_format_rfc1123/1" do
    datetime = ~N[2017-10-06 22:13:01.819041]
    result = JobView.date_format_rfc1123(datetime)
    assert "Fri, 06 Oct 2017 22:13:01 +0000" = result
  end
end
