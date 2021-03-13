
const initSearchSelectRace = () => {
  // const favoriteBar = document.querySelector('.far-bar');



  const dbEspece = document.getElementById('search_espece');
  const dbRace = document.getElementById('search_race');

    if (dbEspece) {

        dbEspece.addEventListener('change', (event) => {

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

                  const entete = "<option value>Veuillez sélectionner</option";
                  dbRace.insertAdjacentHTML("beforeend", entete);

                  data.forEach((result) => {
                         const option = `<option value="${result}">${result}</option`;
                         // console.log(result);
                         dbRace.insertAdjacentHTML("beforeend", option);
                       });

                  //eleve le dernier qui est race indéfinie
                  dbRace.removeChild(dbRace.lastChild);



            });
        });

    }

}

export { initSearchSelectRace };
