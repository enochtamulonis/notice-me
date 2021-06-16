/*
* @Author: Enoch Tamulonis
* @Date:   2021-06-15 20:15:58
* @Last Modified by:   Enoch Tamulonis
* @Last Modified time: 2021-06-15 20:15:59
*/
let user;

export const currentUser = () => {
  if (user) return user;

  const id = getMeta("id");
  const name = getMeta("name");

  user = { id, name };
  return user;
};

function getMeta(name) {
  const element = document.head.querySelector(
    `meta[name='current-user-${name}']`
  );
  if (element) {
    return element.getAttribute("content");
  }
}
