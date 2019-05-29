import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "guestAttended", "eventId"]

    setCheckin(event) {
        console.log();
        let formData = new FormData()
        formData.append("id", event.target.dataset.value)
        formData.append("guest[event_id]", this.eventIdTarget.dataset.value);
        formData.append("guest[name]", event.target.dataset.name);
        fetch(this.data.get("update-url"),{
            body: formData,
            method: 'POST',
            dataType: 'script',
            credentials: "include",
            headers: {
                "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
        },
        }).then(function(response) {
            if (response.status == 200) {
                event.target.disabled= true
                event.target.className= "btn btn-outline-secondary btn-sm"
            }
        })
    }

}