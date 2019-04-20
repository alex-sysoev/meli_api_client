defmodule MeliApiClient.Auth do
  alias MeliApiClient.Base

  @doc """
  URL to redirect user for Mercado Libre authentication.
  """
  @spec auth_url(String.t()) :: String.t()
  def auth_url(redirect_uri) do
    "#{redirect_url()}?response_type=code&client_id=#{MeliApiClient.app_id()}&redirect_uri=#{redirect_uri}"
  end

  @doc """
  Get access token.
  """
  @spec get_token(String.t(), String.t()) :: {:ok, map()} | {:error, term()}
  def get_token(auth_code, redirect_uri) do
    {:ok, body} = %{
      grant_type: "authorization_code",
      client_id: MeliApiClient.app_id(),
      client_secret: MeliApiClient.app_secret(),
      code: auth_code,
      redirect_uri: redirect_uri
    } |> Poison.encode()

    "oauth/token"
    |> Base.post(body)
    |> respond()
  end

  @doc """
  Get user's profile.
  """
  @spec get_profile(String.t()) :: {:ok, map()} | {:error, term()}
  def get_profile(token) do
    "users/me?access_token=#{token}"
    |> Base.get()
    |> respond()
  end

  defp redirect_url() do
    "https://auth.mercadolibre.cl/authorization"
  end

  defp respond(response) do
    case response do
      {:ok, response}  -> {:ok, response}
      {:error, reason} -> {:error, reason}
    end
  end

end
