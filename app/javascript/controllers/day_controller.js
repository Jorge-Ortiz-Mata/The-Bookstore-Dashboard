import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const daysSection = document.getElementById(this.element.id)
    const dataArray = JSON.parse(daysSection.getAttribute('data'));
    const barColors = ["red", "green","blue","orange","brown", "purple", "pink", "yellow", "gray", "black", "white"];
    let days = [];
    let total = [];

    dataArray.forEach(obj => {
      days.push(obj[0]);
      total.push(obj[1]);
    })

    new Chart("days_chart", {
      type: "bar",
      data: {
        labels: days,
        datasets: [{
          backgroundColor: barColors,
          data: total
        }]
      },
      options: {
        legend: {display: false},
        title: {
          display: true,
          text: "Most sells of the week"
        }
      }
    });
  }
}
