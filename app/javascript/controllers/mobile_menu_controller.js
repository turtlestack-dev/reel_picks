import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["menu", "backdrop", "openButton", "closeButton"]

  connect() {
    // Close menu on escape key
    document.addEventListener("keydown", this.closeOnEscape.bind(this))
  }

  disconnect() {
    document.removeEventListener("keydown", this.closeOnEscape.bind(this))
  }

  open() {
    this.menuTarget.classList.remove("hidden")
    this.backdropTarget.classList.remove("hidden")
    document.body.style.overflow = "hidden"
  }

  close() {
    this.menuTarget.classList.add("hidden")
    this.backdropTarget.classList.add("hidden")
    document.body.style.overflow = ""
  }

  closeOnEscape(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }
}
