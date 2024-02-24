import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="complete-form"
export default class extends Controller {
  static targets = ['price', 'renting', 'totalprice'];

  debut = null;
  fin = null;

  complete_debut(e) {
    this.debut = e.target.value;
    this.calcul();
  }
  complete_fin(e) {
    this.fin = e.target.value
    this.calcul();
  }

  calcul() {
    if (this.debut && this.fin) {
      const date1 = new Date(this.debut);
      const date2 = new Date(this.fin);
      const differenceDays = Math.floor((date2 - date1) / (1000 * 60 * 60 * 24));
      this.rentingTarget.value = differenceDays;
      this.totalpriceTarget.value = parseInt(this.priceTarget.textContent) * differenceDays;
    }

  }
}
