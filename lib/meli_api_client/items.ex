defmodule MeliApiClient.Items do
  alias MeliApiClient.Base

  @doc """
  Search for all items by params such as category, limit, etc.
  """
  @spec search(map()) :: {:ok, map()} | {:error, term()}
  def search(options) do
    "sites/MLC/search?" <> URI.encode_query(options |> available_opts())
    |> Base.get()
    |> respond()
  end

  @doc """
  Search for most popular keywords by params.
  """
  @spec trends(map()) :: {:ok, [term()]} | {:error, term()}
  def trends(options) do
    "sites/MLC/trends/search?" <> URI.encode_query(options |> available_opts())
    |> Base.get()
    |> respond()
  end

  @doc """
  Search for hot items by params. Works only with top level
  categories.
  """
  @spec hot(map()) :: {:ok, map()} | {:error, term()}
  def hot(options) do
    "sites/MLC/hot_items/search?" <> URI.encode_query(options |> available_opts())
    |> Base.get()
    |> respond()
  end

  @doc """
  Retrieves visits for item during the given time window.
  """
  @spec visits(String.t(), map()) :: {:ok, map()} | {:error, term()}
  def visits(id, options) do
    "items/#{id}/visits/time_window?" <> URI.encode_query(options |> available_opts())
    |> Base.get()
    |> respond()
  end

  @doc """
  Retrieves visits for item list during the given time window.
  """
  @spec massive_visits([String.t()], map()) :: {:ok, [map()]} | {:error, term()}
  def massive_visits(ids, options) do
    query =
      options
      |> Map.put(:ids, ids |> Enum.join(","))
      |> available_opts()
      |> URI.encode_query()

    "items/visits?" <> query
    |> Base.get()
    |> respond()
  end

  defp respond(response) do
    case response do
      {:ok, response}  -> {:ok, response}
      {:error, reason} -> {:error, reason}
    end
  end

  defp available_opts(opts) do
    ao = [
      :limit, :category, :q, :sort, :filter, :official_store, :offset,
      :last, :ending, :unit, :date_from, :date_to, :ids, :condition, :power_seller
    ]

    opts
    |> Enum.filter(fn({k,_}) -> Enum.member?(ao,k) end)
    |> Enum.into(%{}, &(&1))
  end

end
