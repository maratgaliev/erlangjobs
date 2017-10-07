defmodule Erlangjobs.FeedViewTest do
  use Erlangjobs.ConnCase, async: true

  alias Erlangjobs.FeedView

  test "date_format/1" do
    datetime = ~N[2017-10-06 22:13:01.819041]
    result = FeedView.date_format(datetime)
    assert "Fri, 06 Oct 2017 22:13:01 +0000" = result
  end

  test "job_link/1" do
    result = FeedView.job_link(1)
    assert "http://localhost:4001/#job_1" = result
  end
end
