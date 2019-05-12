import { Controller } from "stimulus"

export default class extends Controller {
    show(position){
        console.log(position.coords.latitude);
    }
    connect(){
        navigator.geolocation.getCurrentPosition(this.show);

    }

}