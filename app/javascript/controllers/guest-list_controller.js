import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "guest_list" ]

  toggle(){
    event.preventDefault()
    this.guest_listTarget.classList.toggle("guest-list--show")
  }
}