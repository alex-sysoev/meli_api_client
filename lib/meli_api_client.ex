defmodule MeliApiClient do
  @moduledoc """
  Documentation for MeliApiClient.
  """

  @spec app_id() :: String.t()
  def app_id() do
    Application.get_env(:meli_api_client, :app_id)
  end

  @spec app_secret() :: String.t()
  def app_secret() do
    Application.get_env(:meli_api_client, :app_secret)
  end
end
