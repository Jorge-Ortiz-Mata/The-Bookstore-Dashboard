import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  resetForm() {
    const timer = setInterval(() => {
      this.element.reset();
      clearInterval(timer);
    }, 75)
  }
}
