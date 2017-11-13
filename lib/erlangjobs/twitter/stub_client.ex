defmodule Erlangjobs.Twitter.StubClient do
  require Logger

  def update(text) do
    Logger.info("POSTED IN TWITTER")
    %ExTwitter.Model.Tweet{text: text}
  end
end
