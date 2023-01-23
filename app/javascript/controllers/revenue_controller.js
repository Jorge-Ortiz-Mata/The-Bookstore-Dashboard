import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const revenueSection = document.getElementById(this.element.id)
    const dataArray = JSON.parse(revenueSection.getAttribute('data'));
    const barColors = ["red", "green","blue","orange","brown", "purple", "pink", "yellow", "gray", "black", "white"];
    let books = [];
    let revenue = [];

    dataArray.forEach(obj => {
      books.push(obj[0]);
      revenue.push(obj[1]);
    });

    new Chart("revenue_chart", {
      type: "pie",
      data: {
        labels: books,
        datasets: [{
          backgroundColor: barColors,
          data: revenue
        }]
      },
      options: {
        title: {
          display: false,
        }
      }
    });
  }
}
