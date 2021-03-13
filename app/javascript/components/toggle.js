
const initToggleVisibility = () => {

// fonction qui affiche une modale et si on clique sur oui, grise l'image dans le formulaire d'edition d'un animal

    // Pour le link_to avec la gem dataConfirmModal
    //intialise la modale custom
    // const dataConfirmModal = require("data-confirm-modal")
    // selectionne les link_to delete_photo de la page
    const linksTo = document.querySelectorAll('#delete_photo');
    const icon = document.querySelectorAll('#icon_deleted');




    linksTo.forEach((lt,index) => {



// dans chrome taper: getEventListeners(window)
// pour avoir tous les EventListeners de la page ! c'est magique

    // console.table(listAllEventListeners());
    // document.addEventListener('confirm:complete', (event) => {
      lt.addEventListener('click', (event) => {
        // console.log("event.return=", event.returnValue);
        // console.log("event1=",event.useCapture);
        // console.log("event2=",event[1].useCapture);

        // console.log(event);
        // lt.style.opacity = "0.7";
      });


      lt.addEventListener('confirm:complete', (event) => {

        // const icon = lt.getElementById('icon_deleted');
        console.log ("icon=", icon[index]);

        console.log("event=",event);
        if (event.detail[0] === true) {
          // console.log("cliqué oui");
          // lt.style.cursor = "not-allowed";
          lt.style.pointerEvents = "none";
          lt.style.opacity = ".8";
          icon[index].style.opacity = "1";
          icon[index].style.fontSize = "8rem";
          icon[index].firstChild.classList.remove('fa-trash');
          icon[index].firstChild.classList.add('fa-times');
          icon[index].style.top = "6%";
          icon[index].style.left = "28%";

        }
        else
        {
          // console.log("cliqué non");
        }
      });
    });




    //Pour le link_to classique
    // document.addEventListener('confirm:complete', (event) => {

    //   console.log("event=",event);


    //   if (event.detail[0] === true) {
    //     console.log("cliqué oui");

    //   }

    //   else
    //   {
    //     console.log("cliqué non");

    //   }
    //   });



}

export { initToggleVisibility };

