defmodule MeliApiClientTest do
  use ExUnit.Case
  doctest MeliApiClient

  test "has app_id in config" do
    assert Application.get_all_env(:meli_api_client) |> Keyword.has_key?(:app_id)
  end

  test "has app_secret in config" do
    assert Application.get_all_env(:meli_api_client) |> Keyword.has_key?(:app_secret)
  end
end
