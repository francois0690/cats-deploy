const initShare = () => {
const btn = document.querySelector('.share');
// const link = document.querySelector('.link-to-share');
if (btn) {
  btn.addEventListener('click', (event) => {
      // console.log(link.innerText)
      console.log(event);
      // const eventId = btn.dataset.event;
      // console.log(eventId);
    if (navigator.share) {
      console.log("it's working");
      navigator.share({
        title: "Caca",
        text: "On partage",
        url: "https://www.google.fr"
      }).then(() => {
        console.log("Link shared");

      })
      .catch(console.error);
    } else {
      console.log("Link was not shared");
    };

  });
}
};

export { initShare };
