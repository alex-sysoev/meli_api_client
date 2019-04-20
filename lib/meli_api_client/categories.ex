defmodule MeliApiClient.Categories do
  alias MeliApiClient.Base

  @doc """
  Retrieves all root categories.
  """
  @spec root() :: {:ok, [term()]} | {:error, term()}
  def root() do
    "sites/MLC/categories"
    |> Base.get()
    |> respond()
  end

  @doc """
  Get information about category based on it's id.
  """
  @spec get(String.t()) :: {:ok, map()} | {:error, term()}
  def get(id) do
    "categories/#{id}"
    |> Base.get()
    |> respond()
  end

  defp respond(response) do
    case response do
      {:ok, response}  -> {:ok, response}
      {:error, reason} -> {:error, reason}
    end
  end

end
