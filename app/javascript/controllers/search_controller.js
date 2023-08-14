import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];
  connect() {}
  doSearch() {
    this.formTarget.submit();
  }
}
