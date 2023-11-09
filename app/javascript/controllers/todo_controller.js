import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets=["form"];
  connect() {
	console.log("arse")
  }

  toggle(e) {
	console.log("click ", e)
	console.log(this.formTarget)
	this.formTarget.submit();
  }
}

