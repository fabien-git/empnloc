import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-image"
export default class extends Controller {
  static targets = [ "displayElement" ]

  pick(event) {
    console.log("Picking an image")
    console.log(this.element)
    console.log(event.originalTarget.outerHTML)
    this.displayElementTarget.innerHTML = ""
    this.displayElementTarget.insertAdjacentHTML('beforeend', `<div class="card-avatar">${event.originalTarget.outerHTML}</div>` )
    document.getElementById('selected-image').value = event.originalTarget.src
  }
}
