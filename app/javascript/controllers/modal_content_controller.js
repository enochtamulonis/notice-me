/*
* @Author: Enoch Tamulonis
* @Date:   2021-06-15 19:34:30
* @Last Modified by:   Enoch Tamulonis
* @Last Modified time: 2021-06-16 16:55:04
*/
import { Controller } from "stimulus"

export default class extends Controller {
  static values = { modalSelector: String }
  connect() {
    let element = document.querySelector(this.modalSelectorValue)
    console.log(element)
    if (element) {
      element.dataset.modalHiddenValue = false
    }
  }
}
