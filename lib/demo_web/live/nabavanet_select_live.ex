defmodule DemoWeb.NabavanetSelectLive do
  use DemoWeb, :live_view

  def mount(_params, %{"nabavanet_id" => nabavanet_id}, socket) do
    {:ok,
     socket
     |> assign(:nabavanet_id, nabavanet_id)
     |> assign(:product, get_product(nabavanet_id))
     |> assign(:query, "")
     |> assign(:products, get_products(""))}
  end

  def handle_event("update_autocomplete", %{"value" => query}, socket) do
    {:noreply,
     socket
     |> assign(:query, query)
     |> assign(:products, get_products(query))}
  end

  def handle_event("set_nabavanet_id", %{"nabavanet_id" => nabavanet_id}, socket) do
    {:noreply,
     socket
     |> assign(:nabavanet_id, nabavanet_id)
     |> assign(:product, get_product(nabavanet_id))}
  end

  def handle_event("clear", %{}, socket) do
    {:noreply,
     socket
     |> assign(:nabavanet_id, nil)
     |> assign(:product, %{})}
  end

  defp get_products(""), do: []

  defp get_products(query) do
    ExNabava.search_products(query, 5)
  end

  defp get_product(""), do: %{}

  defp get_product(id) do
    ExNabava.product(id)
  end

  defp uniq_offers(nil), do: []

  defp uniq_offers(offers) do
    offers
    |> Enum.uniq_by(fn o -> [o["availabilityCode"], o["price"], o["storeId"]] end)
  end
end
