import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  targets=[];
  connect() {
	console.log("arse")
  }

  toggle(e) {
	console.log("click ", e)
  }
}

