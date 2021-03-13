
const initToggleFavoriteIcon = () => {
  // const favoriteBar = document.querySelector('.far-bar');



  const favBar = document.querySelectorAll('.fav-bar');


    favBar.forEach((fb) => {

      const favoritesIcons = fb.querySelectorAll('.icones-fav');

        favoritesIcons.forEach((fi,i) => {

          fi.addEventListener('click', (event) => {

            // event.currentTarget.classList.toggle('visible');

            // if (i === 0) {
              favoritesIcons[1].classList.toggle('visible');
            // } else {
              favoritesIcons[0].classList.toggle('visible');
            // }

          });
        });
    });

}

export { initToggleFavoriteIcon };
