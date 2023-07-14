import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["items"]
  connect() {
    console.log("sussu")
  }
}
