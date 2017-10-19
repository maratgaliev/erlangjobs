defmodule Erlangjobs.Offers.Queries.Job do
  import Ecto.Query, warn: false

  def order_id_desc(query) do
    from j in query,
      order_by: [desc: j.id]
  end
end
