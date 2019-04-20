defmodule MeliApiClient.CategoriesTest do
  use ExUnit.Case, async: true

  @tag :integration
  test "retrieves all root categories" do
    assert {:ok, [%{"id" => _} | _]} = MeliApiClient.Categories.root()
  end
end
