defmodule GearflowDemo.Suppliers do
  @moduledoc """
  The Suppliers context.
  """

  alias GearflowDemo.Suppliers.Brands

  @doc """
  Returns a list of brands in alphabetical order.
  """
  def list_brands() do
    Brands.all() |> Enum.sort_by(fn {_url, name} -> String.downcase(name) end)
  end
end
