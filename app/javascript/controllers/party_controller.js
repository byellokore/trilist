import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "link", "name" ]

    seoLink(){
        this.linkTarget.value = this.nameTarget.value.toLowerCase()
                                .replace(/\s/g,'-')
                                .normalize('NFD').replace(/[\u0300-\u036f]/g, "");
    }

    copy() {
        this.linkTarget.select()
        document.execCommand("copy")
    }
}