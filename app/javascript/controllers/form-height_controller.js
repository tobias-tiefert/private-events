import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "text_area" ]

  adjust_height(){
    this.text_areaTarget.style.height = "auto" ;
    this.text_areaTarget.style.height = this.scrollHeight + "px";
  }
  get scrollHeight() {
    return this.text_areaTarget.scrollHeight;
  }
  get height() {
    return this.text_areaTarget.style.height;
  }
}