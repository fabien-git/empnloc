import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-image"
export default class extends Controller {
  static targets = [ "displayElement" ]

  pick(event) {
    console.log("Picking an image")
    console.log(this.element)
    console.log(event.target.src)
    this.displayElementTarget.innerHTML = ""
    this.displayElementTarget.insertAdjacentHTML('beforeend', `<div class="card-avatar"><img width="150" height="150" src=${event.target.src}></div>` )
    document.getElementById('selected-image').value = event.target.src
  }
}
