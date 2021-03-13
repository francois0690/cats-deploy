
const initPreview = () => {
  // const favoriteBar = document.querySelector('.far-bar');



  const pictureInput = document.getElementById('animal_photos');

  // const pictureOutput = document.getElementById('pictureOutput');
  const divOutput = document.getElementById('picturesOutput');
  const divPhotos = document.getElementById('new_photos');



    if (pictureInput) {

      //  detectFiles(event) {
      //  const $image: any = document.querySelector('#file');
      //  Array.from($image.files).forEach((file: any) => {
      //  let reader = new FileReader();
      //  reader.onload = (e: any) => { this.urls.push(e.target.result); }
      //  reader.readAsDataURL(file);
      // }


        pictureInput.addEventListener('change', (event) => {


          //suppr les photo éventuelles
          while (divOutput.firstChild) {
                divOutput.removeChild(divOutput.firstChild);
              }
          //ajoute le commentaire vide
          // divOutput.insertAdjacentHTML("beforeend", "<p id='txt_new_photo'></p>");

          const files = event.target.files;
          const arr = [];

          // for (let i = 0; i < files.length; i++) {
          Array.from(files).forEach((image,i) => {
            const reader = new FileReader();
            reader.onload = function(file) {
              // this.arr.push(file.target.result);
              const img = new Image();
              img.src = file.target.result;
              arr.push(img.src);

              const imgHTML = `<img src="${arr[i]}" class="imgHTML${i}" id="photo" width="120" height="120" >`;
              // console.log("imgHTML=", imgHTML);
              divOutput.insertAdjacentHTML("beforeend", imgHTML);

              // if


            }



            reader.readAsDataURL(image);
            // console.log("tableau final=", arr);
          });

            // console.log(files.length);
            // console.log(txtPhoto.innerText);
            // console.log(txtPhoto.innerHTML);

            divPhotos.classList.remove('hidden');

            const txtPhoto = document.getElementById('txt_new_photo');
            if (files.length > 1) {
              txtPhoto.innerText = "Apercu des nouvelles photos qui seront ajoutées :";
            } else {
              txtPhoto.innerText = "Apercu de la nouvelle photo qui sera ajoutée :";

            }
          // console.log(files);







        // 1 seule image
        // const pictureInput = document.getElementById('animal_photos');
        // const pictureOutput = document.getElementById('pictureOutput');


        // pictureInput.addEventListener('change', (event) => {

        //   const files = event.target.files;
        //   const image = files[0]
        //   // here's the file size
        //   // console.log(image.size);
        //   var reader = new FileReader();
        //   reader.onload = function(file) {

        //     var img = new Image();
        //     img.src = file.target.result;
        //     console.log(pictureOutput.innerText);

        //     console.log(pictureOutput.attributes.src.value)
        //      pictureOutput.attributes.src.value = img.src;
        //   }

        //   reader.readAsDataURL(image);
        //   console.log(files);
        });
    }
}

export { initPreview };
