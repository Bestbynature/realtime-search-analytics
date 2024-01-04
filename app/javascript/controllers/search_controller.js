import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "suggestions"];
  connect() {
    console.log("connected");
    document.addEventListener("click", (event) => {
      if (!this.element.contains(event.target)) {
        this.hideSuggestions();
      }
    });
  }

  suggestions() {
    const query = this.inputTarget.value;
    const url = this.element.dataset.suggestionsUrl;

    clearTimeout(this.timeout);

    this.timeout = setTimeout(() => {
      this.requestSuggestions(url, query);
    }, 300);
  }

  requestSuggestions(url, query) {
    if (query.length === 0) {
      this.hideSuggestions();
      return;
    }
    this.showSuggestions();

    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      },
      body: JSON.stringify({ query }),
    }).then((response) => {
      response.text().then((html) => {
        document.body.insertAdjacentHTML("beforeend", html);
      });
    });
  }

  childClicked(event) {
    this.childWasClicked = this.element.contains(event.target);
    this.hideSuggestions();
  }

  showSuggestions() {
    this.suggestionsTarget.classList.remove("hidden");
  }

  hideSuggestions() {
    if (this.childWasClicked) {
      this.suggestionsTarget.classList.add("hidden");
    }
    this.childWasClicked = false;
  }
}
