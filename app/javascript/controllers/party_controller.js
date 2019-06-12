import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "link", "name", "seo" ]

    seoLink(){
        this.linkTarget.value = "https://www.trilist.com.br/nalista/" +
                                this.nameTarget.value.toLowerCase()
                                .replace(/\s/g,'-')
                                .normalize('NFD').replace(/[\u0300-\u036f]/g, "");
    }

    seoUrl(){
        this.seoTarget.value = this.nameTarget.value.toLowerCase()
                                .replace(/\s/g,'-')
                                .normalize('NFD').replace(/[\u0300-\u036f]/g, "");

    }

    copy() {
        this.linkTarget.select()
        document.execCommand("copy")
    }

    addTicket(event){
        let componentId = "_" + Date.now();
        event.target.parentNode.insertAdjacentHTML("beforeend","<div id='"+ componentId + "' class='row'><div class='col ticket-name'></div><div class='col ticket-value'></div></div>");

        let ticketName = document.createElement("input");
        let ticketValue = document.createElement("input");

        ticketName.type = "text";
        ticketName.className = "form-control mt-1";
        ticketName.placeholder = "Ingresso";

        ticketValue.type = "text";
        ticketValue.className = "form-control mt-1";
        ticketValue.placeholder = "0.00";

        let newRow = document.getElementById(componentId);
        newRow.querySelector(".ticket-name").appendChild(ticketName);
        newRow.querySelector(".ticket-value").appendChild(ticketValue);
        newRow.querySelector(".ticket-value").insertAdjacentHTML("afterend", "<i class=\'fa fa-times\' data-action=\'click->party#removeTicket\'></i>")
    }

    removeTicket(event){
        let ticketToRemove = event.target.parentNode
        ticketToRemove.remove();
    }
}