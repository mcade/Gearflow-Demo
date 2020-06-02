defmodule GearflowDemoWeb.PageLiveTest do
  use GearflowDemoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Shop by Brand"
    assert render(page_live) =~ "Shop by Brand"
  end
end
