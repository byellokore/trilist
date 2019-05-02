import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "link", "name", "seo" ]

    seoLink(){
        this.linkTarget.value = "https://www.trilist.com.br/add_guest/" +
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
}