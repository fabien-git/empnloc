import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["element"]

  connect() {
    console.log("Hello, Stimulus!")
  }

  clear(event) {

    fetch('/', { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log(data)

      })


    //event.preventDefault();
    //console.log("clear");
    //const top = document.querySelector('.top-employee');
    //const all = document.querySelector('.all-employees');
    //const results = document.querySelector('.search-results');
    //// console.log(input.innerHTML);
    //// input.innerHTML = '';
    //top.style.display = 'none';
    //all.style.display = 'none';
    //results.style.display = 'block';
  }

  input_search() {
    const input = document.getElementById('query');
    const button = document.querySelector('.button-query');
    console.log(input.value)
    // button.setAttribute("href", input);
  }
}
