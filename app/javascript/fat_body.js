window.addEventListener('load', function(){
  const male = document.getElementById("male")
  const calculation = document.getElementById("calculation")
  
  calculation.addEventListener('click', function(){
    console.log("click OK")
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