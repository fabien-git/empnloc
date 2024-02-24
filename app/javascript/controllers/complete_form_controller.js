import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="complete-form"
export default class extends Controller {
  static targets = ['price', 'renting', 'totalprice'];

  debut = null;
  fin = null;

  connect() {
    console.log('Hello from complete_form.js')
  }

  complete_debut(e) {
    this.debut = e.target.value
    console.log(this.priceTarget.textContent);
    this.calcul();
  }
  complete_fin(e) {
    this.fin = e.target.value
    console.log(this.fin)
    this.calcul();
  }

  calcul() {
    if (this.debut && this.fin) {
      const date1 = new Date(this.debut);
      const date2 = new Date(this.fin);
      const differenceDays = Math.floor((date2 - date1) / (1000 * 60 * 60 * 24));
      this.rentingTarget.value = differenceDays;
      console.log(this.priceTarget);
      this.totalpriceTarget.value = parseInt(this.priceTarget.textContent) * differenceDays;
    }

  }
}
