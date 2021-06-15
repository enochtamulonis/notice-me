/*
* @Author: Enoch Tamulonis
* @Date:   2021-06-15 16:23:10
* @Last Modified by:   Enoch Tamulonis
* @Last Modified time: 2021-06-15 16:26:07
*/
import { Controller } from "stimulus"

export default class extends Controller {
  show() {
    if (this.element.classList.contains('hidden') {
      this.element.classList.remove('hidden')
    }
  }

  hide() {
    if (this.element.classList.contains('hidden')) {
      this.element.classList.add('hidden')
    }
  }
}
