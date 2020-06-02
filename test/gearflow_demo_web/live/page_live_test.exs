defmodule GearflowDemoWeb.PageLiveTest do
  use GearflowDemoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Shop by Brand"
    assert render(page_live) =~ "Shop by Brand"
  end

  test "changing form input suggests matching brand", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    assert render_submit(view, :suggest, %{q: "alp"}) =~ "Alpine"
  end

  test "searching for a product that doesn't exists shows not found", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")
    assert render_submit(view, :search, %{q: "abc"}) =~ "No brands found"
  end
end
