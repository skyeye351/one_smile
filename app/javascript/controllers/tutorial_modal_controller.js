import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    // 初回表示だけならCookieやLocalStorageで制御
    const seen = localStorage.getItem("tutorial_shown");
    if (!seen) {
      this.modalTarget.classList.remove("hidden");
      localStorage.setItem("tutorial_shown", "true");
    }
  }

  close() {
    this.modalTarget.classList.add("hidden");
  }
}
