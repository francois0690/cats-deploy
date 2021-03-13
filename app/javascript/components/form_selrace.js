
const initFromSelectRace = () => {
  // const favoriteBar = document.querySelector('.far-bar');



  const dbEspece = document.getElementById('animal_espece');
  const dbRace = document.getElementById('animal_race');

    if (dbEspece) {

        dbEspece.addEventListener('change', (event) => {

                // event.currentTarget.classList.toggle('visible');

                // console.log(dbEspece.selectedIndex); // rend l'index
                // console.log(dbEspece.value); // rend la valeur





              // fetch(`dropdown?query_${dbEspece.value}`, {
              fetch(`dropdown?espece=${dbEspece.value}`, {
              headers: { accept: 'application/json'}
            }).then((response) => response.json())
            .then(data => {


              // console.log(`dropdown?${dbEspece}`);
              // console.log(`dropdown?query_${dbEspece.value}`);

              console.log(data);
              const res = dbEspece.value

              console.log(dbRace);

              console.log(dbRace.childElementCount);

              while (dbRace.firstChild) {
                dbRace.removeChild(dbRace.firstChild);
              }
              // for (let i = 0; i < dbRace.childElementCount ; i++) {
              //   dbRace.removeChild(i);
              // };

                  data.forEach((result) => {
                         const option = `<option value="${result}">${result}</option`;
                         // console.log(result);
                         dbRace.insertAdjacentHTML("beforeend", option);
                       });





            });
        });

    }

}

export { initFromSelectRace };
