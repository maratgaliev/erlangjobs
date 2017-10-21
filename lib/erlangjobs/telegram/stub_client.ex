defmodule Erlangjobs.Telegram.StubClient do
  def send_message(_chat_id, text, _options \\ []) do
    {:ok, %Nadia.Model.Message{text: text}}
  end
end
