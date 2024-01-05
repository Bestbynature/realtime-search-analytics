import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "suggestions"];

  connect() {
    document.addEventListener("click", (event) => {
      if (!this.element.contains(event.target)) {
        this.hideSuggestions();
      }
    });

    this.suggestionsTarget.addEventListener("click", (event) => {
      const suggestionItem = event.target.closest(".suggestion-item");
      if (suggestionItem) {
        event.preventDefault();
        this.handleSuggestionClick(suggestionItem);
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
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']")
          .content,
      },
      body: JSON.stringify({ query: query }),
    }).then((response) => {
      response.text().then((html) => {
        document.body.insertAdjacentHTML("beforeend", html);
      });
    });
  }

  childClicked(event) {
    const suggestionItem = event.target.closest(".suggestion-item");
    if (suggestionItem) {
      event.preventDefault();
      this.handleSuggestionClick(suggestionItem);
    }
  }

  handleSuggestionClick(suggestionItem) {
    const query = suggestionItem.textContent.trim();
    this.inputTarget.value = query;
    this.hideSuggestions();

    const link = suggestionItem.querySelector("a");
    const articleUrl = link.getAttribute("href");

    this.inputTarget.value = link.textContent.trim();
    this.hideSuggestions();

    window.location.href = articleUrl;
  }

  showSuggestions() {
    this.suggestionsTarget.classList.remove("hidden");
  }

  hideSuggestions() {
    this.suggestionsTarget.classList.add("hidden");
  }
}
