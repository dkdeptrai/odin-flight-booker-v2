import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["fields", "template"];
	passengersCount = 0;

	connect() {
		this.passengersCount = this.fieldsTarget.children.length;
	}

	add(event) {
		event.preventDefault();
		console.log("buttin is clicked");
		this.passengersCount++;
		let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, this.passengersCount);
		this.fieldsTarget.insertAdjacentHTML("beforeend", content);
	}

	remove(event) {
		event.preventDefault();

		if (this.passengersCount <= 1) {

			alert("Can't remove last passenger");
			return;
		}

		let wrapper = event.target.closest(".nested-fields");
		if (wrapper.dataset.newRecord == "true") {
			wrapper.remove();
		} else {
			wrapper.querySelector("input[name*='_destroy']").value = 1;
			wrapper.style.display = "none";
		}
		this.passengersCount--;
		this.reindex();
	}

	reindex(event) {
		this.fieldsTarget.querySelectorAll(".nested-fields").forEach((field, index) => {
			field.querySelector("h3").textContent = `Passenger ${index + 1}`;
		});
	}
}