defmodule MeliApiClientTest do
  use ExUnit.Case
  doctest MeliApiClient

  test "has app_id in config" do
    assert Application.get_env(:meli_api_client, :app_id)
  end

  test "has app_secret in config" do
    assert Application.get_env(:meli_api_client, :app_secret)
  end
end
