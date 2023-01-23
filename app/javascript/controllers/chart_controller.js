import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "output" ]

  connect() {
    const bookDiv = document.getElementById(this.element.id)
    const dataChart = JSON.parse(bookDiv.getAttribute('data'))

    new Chart(`chart_${this.element.id}`, {
      type: "scatter",
      data: {
        datasets: [{
          pointRadius: 4,
          pointBackgroundColor: "rgb(0,0,255)",
          data: dataChart
        }]
      },
      options: {
        legend: {display: false}
      }
    });
  }
}
