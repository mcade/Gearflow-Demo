defmodule GearflowDemoWeb.PageLive do
  use GearflowDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: [])}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    if query != "" do
      {:noreply, assign(socket, results: search(query), query: query)}
    else
      {:noreply, assign(socket, results: [])}
    end
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    case search(query) do
      [{url, _brand}] ->
        {:noreply, redirect(socket, external: "https://gearflow.com/brands/#{url}")}

      _ ->
        {:noreply,
         socket
         |> put_flash(:error, "No brands found matching \"#{query}\"")
         |> assign(results: [], query: query)}
    end
  end

  defp search(query) do
    dc_query = String.downcase(query)

    brands =
      for {url, brand} <- GearflowDemo.Suppliers.list_brands(),
          brand |> String.downcase() |> String.starts_with?(dc_query),
          do: {url, brand}

    # only take first 10 items to keep datalist small and fast
    Enum.take(brands, 10)
  end
end
