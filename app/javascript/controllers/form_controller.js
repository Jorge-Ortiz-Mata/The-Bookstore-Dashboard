import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  resetBookForm() {
    const timer = setInterval(() => {
      this.element.reset();
    }, 75)
  }
}
