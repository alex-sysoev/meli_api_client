 MeliApiClient
==============

Small elixir client for Mercado Libre API. Couple of functions are implemented.

## Installation

```elixir
def deps do
  [
    {:meli_api_client, git: "https://github.com/alex-sysoev/meli_api_client.git", tag: "0.1"}
  ]
end
```
## Usage

Fetch all root categories:
```elixir
{:ok, roots} = MeliApiClient.Categories.root
```

Search for items:
```elixir
{:ok, items} = MeliApiClient.Items.search(%{q: "Some keyword"})
```
