import consumer from "./consumer";

const initCommunityCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.communityId;
    consumer.subscriptions.create({ channel: "CommunityChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.scrollTop = 99999999;
      },
      initialized() {
        setTimeout(() => {
          messagesContainer.scrollTop = 99999999;
        }, 200)
      }
    });
  };
};

export { initCommunityCable };
