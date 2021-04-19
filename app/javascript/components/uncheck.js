const initUncheckSelection = () => {

  const dbEspece = document.getElementById('search_espece');
  const dbRace = document.getElementById('search_race');

  function uncheck(source) {




    if (dbEspece) {

        dbEspece.addEventListener('change', (event) => {

              fetch(`dropdown?espece=${dbEspece.value}`, {
              headers: { accept: 'application/json'}
            }).then((response) => response.json())
            .then(data => {

//   checkboxes = document.getElementsByName('foo');
//   for(var i=0, n=checkboxes.length;i<n;i++) {
//     checkboxes[i].checked = source.checked;
//   }
 }


 }

export { initUncheckSelection };

