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
        let ticketName = document.createElement("input");
        let ticketValue = document.createElement("input");

        ticketName.type = "text";
        ticketName.className = "form-control mt-1";
        ticketName.placeholder = "Ingresso";
        ticketValue.type = "text";
        ticketValue.className = "form-control mt-1";
        ticketValue.placeholder = "0.00";

        document.querySelector(".ticket-name").appendChild(ticketName);
        document.querySelector(".ticket-value").appendChild(ticketValue);
        document.querySelector(".ticket-value").insertAdjacentHTML("afterend", "<i class=\'fa fa-times\'></i>")
    }
}