/*
* @Author: Enoch Tamulonis
* @Date:   2021-06-15 20:38:46
* @Last Modified by:   Enoch Tamulonis
* @Last Modified time: 2021-06-16 18:50:41
*/
import { Controller } from "stimulus"
import { currentUser } from "components/current_user"

export default class extends Controller {
  static classes = ["mine", "other", "container"]
  static values = { ownerId: Number, containerSelector: String }

  connect() {
    let userId = currentUser().id
    if (this.ownerIdValue == userId) {
      this.element.classList.add(this.mineClass)
    } else {
      this.element.classList.add(this.otherClass)
    }
    this.scrollChatDown()
  }

  scrollChatDown() {
    let messagesContainer = this.element.closest(this.containerSelectorValue)
    if (messagesContainer) {
      messagesContainer.scrollTop = messagesContainer.scrollHeight
      setTimeout(() => {
        if (messagesContainer.scrollTop != messagesContainer.scrollHeight) {
          messagesContainer.scrollTop = messagesContainer.scrollHeight
        }
      }, 200)
    }
  }
}
