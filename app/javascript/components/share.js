// Si API Web Share n'est pas supportée, alors la méthode sera undefined
//icone share sur mobile


const initShare = () => {


const socialBars = document.querySelectorAll('.social-bar');
// const btn = document.querySelectorAll('.share');
// const link = document.querySelectorAll('.link-to-share');


socialBars.forEach((sb,i) => {

  // if (btn) {
    const btn = sb.querySelector('.share');
    const link = sb.querySelector('.link-to-share');

      // console.log("link.innerText=",link.innerText, "index=",i);
  if (btn) {
    btn.addEventListener('click', (event) => {
        console.log("click sur link.innerText=",link.innerText, "index=",i);
        // console.log(event);

        // const eventId = btn.dataset.event;
        // console.log(eventId);

      if (navigator.share) {
        console.log("it's working");
        navigator.share({
          title: "Mes animaux",
          text: "Cela peut vous interesser : ",
          url: link.innerText

        }).then(() => {
          console.log("Link shared");

        })
        .catch(console.error);
      } else {
        console.log("Link was not shared");
      };

    });
  }


});


};

export { initShare };


//` //"<%= @@url_for_js >" //  "https://www.google.fr" //`${link.innerText}`
