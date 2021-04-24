// Si API Web Share n'est pas supportée, alors la méthode sera undefined
//icone share sur mobile


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
        title: "<%= @name_for_js >",
        text: "Partagez cette fiche",
        url: "<%= @url_for_js >" //  "https://www.google.fr" //`${link.innerText}`
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
