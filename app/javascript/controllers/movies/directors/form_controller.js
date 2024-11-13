import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movies--directors--form"
export default class extends Controller {
  static targets = [ "directorForm", "directorSelect", "toggleButton" ]

  toggle() {
    this.directorSelectTarget.classList.toggle("visually-hidden");
    this.directorFormTarget.classList.toggle("visually-hidden");

    if (this.directorFormTarget.classList.contains("visually-hidden")) {
      this.toggleButtonTarget.textContent = "Create New Director";
    } else {
      this.toggleButtonTarget.textContent = "Select Existing Director";
    }
  }
}
