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
        this.displayHTML(data);
      })

  }
  displayHTML(html) {
    const allEmployees = document.querySelector('.top-employee');
    //const allEmployees = document.querySelector('.all-employees');
    allEmployees.outerHTML = html;
    const title = document.querySelector('.title_top');
    console.log(title);
    title.textContent = "Les résultats";
    console.log(title);
  }

  input_search() {
    const input = document.getElementById('query');
    const button = document.querySelector('.button-query');
    console.log(input.value)
    // button.setAttribute("href", input);
  }
}
