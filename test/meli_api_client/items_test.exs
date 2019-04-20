defmodule MeliApiClient.ItemsTest do
  use ExUnit.Case, async: true

  @tag :integration
  test "gets items for category" do
    options = %{ category: "MLC1747", limit: 5 }
    assert {:ok, %{"results" => results}} = MeliApiClient.Items.search(options)
    assert Enum.count(results) == 5
  end

  @tag :integration
  test "gets trend keywords for category" do
    options = %{ category: "MLC1747", limit: 5 }
    assert {:ok, results = [%{"url" => _, "keyword" => _} | _]} = MeliApiClient.Items.trends(options)
    assert Enum.count(results) > 0 
  end

  @tag :integration
  test "gets visits for item" do
    {:ok, result} = MeliApiClient.Items.search(%{category: "MLC1747", limit: 1})
    id = (result["results"] |> Enum.at(0))["id"]
    options = %{last: 5, unit: "day"}
    assert {:ok, %{"total_visits" => _}} = MeliApiClient.Items.visits(id, options)
  end

  @tag :integration
  test "gets visits for many items" do
    {:ok, result} = MeliApiClient.Items.search(%{category: "MLC1747", limit: 2})
    ids = result["results"] |> Enum.map(&(&1["id"]))
    options = %{date_from: Timex.now() |> Timex.shift(days: -5) |> DateTime.to_iso8601(), date_to: Timex.now() |> DateTime.to_iso8601()}
    assert {:ok, [%{"total_visits" => _}|_]} = MeliApiClient.Items.massive_visits(ids, options)
  end
end
