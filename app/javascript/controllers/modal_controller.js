/*
* @Author: Enoch Tamulonis
* @Date:   2021-06-15 16:23:10
* @Last Modified by:   Enoch Tamulonis
* @Last Modified time: 2021-06-16 18:29:00
*/
import { Controller } from "stimulus"

export default class extends Controller {
  static values = { hidden: Boolean }
  static classes = ['hidden']

  hiddenValueChanged() {
    if (this.hiddenValue) {
      document.body.classList.remove('fixed')
      this.element.classList.add(this.hiddenClass)
    } else {
      document.body.classList.add('fixed')
      this.element.classList.remove(this.hiddenClass)
    }
  }

  close(event) {
    event.preventDefault()
    this.hiddenValue = true
  }
}
