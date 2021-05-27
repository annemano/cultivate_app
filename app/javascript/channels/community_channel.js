import consumer from "./consumer";

const initCommunityCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.communityId;
    consumer.subscriptions.create({ channel: "CommunityChannel", id: id }, {
      received(data) {
        console.log(messagesContainer.insertAdjacentHTML('beforeend', data));
      }
    })
  }
}

export { initCommunityCable };
