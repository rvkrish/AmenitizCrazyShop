import { Controller } from "@hotwired/stimulus";
import React from "react";
import  {createRoot}  from "react-dom/client";
import Shop from "../components/Shop";


// Connects to data-controller="shop"
export default class extends Controller {
  connect() {
    const shop = document.getElementById("shop");
    createRoot(shop).render(<Shop />)
  }
}
