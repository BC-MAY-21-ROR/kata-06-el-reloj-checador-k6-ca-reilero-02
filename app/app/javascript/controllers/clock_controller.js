import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hours", "minutes","seconds"]

  connect() {
    setInterval(()=>this.time,1000)
  }

  get time(){
    let time = new Date();
    this.hoursTarget.textContent = time.getHours();
    this.minutesTarget.textContent = time.getMinutes();
    this.secondsTarget.textContent = time.getSeconds();
  }
}