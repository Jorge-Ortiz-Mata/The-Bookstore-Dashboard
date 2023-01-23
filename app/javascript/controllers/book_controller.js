import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const bookDiv = document.getElementById(this.element.id);
    const dataChart = JSON.parse(bookDiv.getAttribute('data'));
    let xValues = [];

    for (let i = 0; i < dataChart.length; i++) {
      xValues.push(i + 1);
    }

    new Chart(`chart_${this.element.id}`, {
      type: "line",
      data: {
        labels: xValues,
        datasets: [{
          fill: false,
          lineTension: 0,
          backgroundColor: "rgba(0,0,255,1.0)",
          borderColor: "rgba(0,0,255,0.1)",
          data: dataChart
        }]
      },
      options: {
        legend: {display: true},
        title: {
          display: false,
        }
      }
    });
  }
}
