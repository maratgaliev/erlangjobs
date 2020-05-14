defmodule Erlangjobs.Offers.Queries.Job do
  import Ecto.Query, warn: false

  def order_id_desc(query) do
    from j in query,
      order_by: [desc: j.id]
  end

  def approved(query) do
    from j in query,
      where: [is_approved: true]
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"
  
    from j in query,
    where: ilike(j.title, ^wildcard_search),
    or_where: ilike(j.description, ^wildcard_search)
  end
end
