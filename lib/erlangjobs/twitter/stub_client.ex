defmodule Erlangjobs.Twitter.StubClient do
  def update(text) do
    %ExTwitter.Model.Tweet{text: text}
  end
end
