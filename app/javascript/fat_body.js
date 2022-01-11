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
    age = parseInt(dates[2].value);
    height = parseInt(dates[3].value);
    weight = parseFloat(dates[4].value);
    body_fat = parseFloat(dates[5].value);
    nutrients_p = parseFloat(dates[6].value);
    nutrients_f = parseFloat(dates[7].value);
    nutrients_c = parseFloat(dates[8].value);

    bmi = (weight * 100 * 100) / (height * height);  
    
    if (gender = "male"){
      tdee = 66.4730 + 13.7516 * weight + 5.0033 * height - 6.7550 * age;
    }else{
      tdee = 655.0955 + 9.5634 * weight + 1.8496 * height - 4.6756 * age;
    }
    
    p = tdee * nutrients_p / 400;
    f = tdee * nutrients_f / 900;
    c = tdee * nutrients_c / 400;

    tdee1 = tdee * 1.5;
    tdee2 = tdee * 1.75;
    tdee3 = tdee * 2;
  })
})
