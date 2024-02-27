import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["element", "title"]

  connect() {
    console.log("Hello, Stimulus!")
  }

  clear(event) {

    fetch(`/?query=${event.target.value}`, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.displayHTML(data);

      })
  }
  displayHTML(html) {
    const allEmployees = document.querySelector('.top-employee');
    allEmployees.outerHTML = html;
    const title = document.querySelector('.title_top');
    title.textContent = "Les résultats"
  }

  input_search() {
    const input = document.getElementById('query');
    const button = document.querySelector('.button-query');
    console.log(input.value)
    // button.setAttribute("href", input);
  }
}
