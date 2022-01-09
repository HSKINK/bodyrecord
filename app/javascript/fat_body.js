window.addEventListener('load', function(){
  let dates = document.querySelectorAll("input")
  radio = document.getElementsByName("gender")
  const calculation = document.getElementById("calculation")
  
  calculation.addEventListener('click', function(){
    for(i=0;i<radio.length;i++){
      if(radio[i].checked){
        gender = radio[i].value;
      }
    }
    console.log(gender)
    console.log(dates[2].value)
    console.log(dates[3].value)
    console.log(dates[4].value)
    console.log(dates[5].value)
    console.log(dates[6].value)
    console.log(dates[7].value)
    console.log(dates[8].value)
  })
})
// window.addEventListener('load', () => {
//   const priceInput = document.getElementById("item-price");
//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;

//     const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

//     const profit = document.getElementById("profit");
//     profit.innerHTML = inputValue - addTaxDom.innerHTML
//   })
// });