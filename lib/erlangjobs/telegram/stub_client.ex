defmodule Erlangjobs.Telegram.StubClient do
  require Logger

  def send_message(_chat_id, text, _options \\ []) do
     Logger.info("POSTED IN TELEGRAM")
    {:ok, %Nadia.Model.Message{text: text}}
  end
end
