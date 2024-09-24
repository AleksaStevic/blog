import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    edit(event) {
        event.preventDefault();
        fetch(this.element.dataset.path, {
            headers: {
                'Accept': 'text/vnd.turbo-stream.html'
            }
        })
        .then(response => response.text())
        .then(html => {
            Turbo.renderStreamMessage(html)
        });
    }
}