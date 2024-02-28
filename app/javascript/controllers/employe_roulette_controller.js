import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="employe-roulette"
export default class extends Controller {

  static targets = ['link'];

  connect() {
    console.log("ok");

  }


  result() {
    const pEmployee_roulette = document.querySelector('.random-job p:nth-child(5)').textContent;
    const modal = document.querySelector('.modal-roulette-content');
    modal.classList.add('slideout');
    modal.style.transform = "skewX(-10deg) translateX(-200%)";



    function sendData(pEmployee_roulette) {
      console.log(pEmployee_roulette);
      fetch('/employees/fetch_employee_data', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ data: pEmployee_roulette })
      })
        .then(response => response.json())
        .then(data => {
          console.log('transmission');
          console.log(data.employee.id);
          window.location.href = `/employees/${data.employee.id}/`
        })
        .catch(error => console.error('Erreur lors de la requête:', error));
    }


    setTimeout(() => sendData(pEmployee_roulette), 200);
  }



  modal() {
    const modal = document.querySelector('.modal-roulette');
    const btn = document.querySelector('.redirection-employee-roulette')
    modal.style.display = 'flex';


    const jobs = ['Parle avec les dauphins', 'Péteuse professionnelle', 'Champion de gobage de burgers', 'Doublure mains', 'Danseuse de tecktonik']
    // fonction aléatoire du tableau
    function shuffle(array) {
      array.sort(() => Math.random() - 0.5);
    }
    shuffle(jobs);

    const container = document.querySelector('.random-job');
    jobs.forEach((job) => {
      const p = document.createElement('p');
      p.textContent = job;
      container.appendChild(p);
    })

    function rotate() {
      const Allp = Array.from(document.querySelectorAll('.random-job p'));
      const firstRow = Allp[0];
      const lastRow = Allp[Allp.length - 1];
      container.insertBefore(lastRow, firstRow);
    }

    function displayBtn(btn) {
      btn.style.display = "block"
    }


    let time = setInterval(rotate, 50);

    setTimeout(function () {
      clearInterval(time); // Arrêt de l'intervalle en utilisant son ID
    }, 2000);

    setTimeout(() => { displayBtn(btn) }, 2000); // Arrêt de l'intervalle en utilisant son ID


  }

}
