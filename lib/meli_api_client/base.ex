defmodule MeliApiClient.Base do

  @url "https://api.mercadolibre.com"

  @doc """
  Call MELI endpoint with params and decode the response.
  """
  @spec get(String.t()) :: {:ok, map()} | {:error, term()}
  def get(endpoint) do
    case HTTPoison.get("#{@url}/#{endpoint}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body |> Poison.decode!}
      {:ok, %HTTPoison.Response{status_code: code}} ->
        {:error, code}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  @doc """
  Call Meli post endpoints.
  """
  @spec post(String.t(), String.t()) :: {:ok, map()} | {:error, term()}
  def post(endpoint, params) do
    case HTTPoison.post("#{@url}/#{endpoint}", params) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body |> Poison.decode!}
      {:ok, %HTTPoison.Response{status_code: code}} ->
        {:error, code}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

end
