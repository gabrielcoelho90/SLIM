import { Controller } from "@hotwired/stimulus"

//This con
export default class extends Controller {
  static targets = ["name", "calories","protein", "carbs", "fat", "options", "searchButton", "qty", "measureUnit"]

  connect(){
    this.count = 1;
  }

  //It sends a AJAX to my service "get_food_info.rb" with the user's food input and receive
  //"data" as array of food variation, each variant is a hash of info, like calories, fat, carbs....
  search(event){
    this.foods = []
    const userInput = this.nameTarget.value
    this.count = this.count + 1;
    console.log(userInput);
    const requestDetails = {
      method: "GET",
      headers: {"Content-Type": "application/json"}
    }
    fetch('/search_food?' + new URLSearchParams({name: userInput}).toString(), requestDetails)
      .then(response => response.json())
      .then(data => {
        this.foods = data;
        this.displayOptions(data);
      });
  }

  displayOptions(data) {
    const displayArea = this.optionsTarget;
    displayArea.innerHTML = "";
    const options = this.createOptions(data);
    displayArea.insertAdjacentHTML("beforeend",
      `${options}`
    );
  }
  // Gets the food variations data and work on it to create a board, listing the name, measument unit
  // and calories of 10 variations of that food.
  createOptions(foods){
    let listContent = " ";
    let identity = -1;
    foods.forEach((food) => {
      identity += 1;
      const foodName = food.food_name;
      const unit = food.unit
      const cal = food.calories
      listContent += `<button type="button" class="list-group-item list-group-item-action" data-identity=${identity}>${foodName}- ${unit} - ${cal}</button>`;
  });
  const finalContent = `<div class="list-group">${listContent}</div>`;
  return finalContent
  }

  // Listens wich food option user has chosen and fill in, through the return
  //of "passHiddenValues" function, the food info in hidden fields. Once the user save
  //the meal, those hidden info will be passed through my form to my controller.
  select(event) {
    const foodChosen = event.target
    const newValue = foodChosen.innerHTML;
    this.nameTarget.value = newValue;
    const foodChosenIdentity = Number(foodChosen.dataset.identity);
    const hiddenInputs = this.passHiddenValues(foodChosenIdentity);
    this.caloriesTarget.value = hiddenInputs.calories;
    this.proteinTarget.value = hiddenInputs.protein
    this.carbsTarget.value = hiddenInputs.carbs
    this.fatTarget.value = hiddenInputs.fat
    this.optionsTarget.innerHTML = "";
  }

  // It is in charge to identify, through "data-identity" attribute, which option was selected
  //by the user. Once detected, extract the info from the "data" and return it as a hash
  // that will be passed in hidden fields inside "select" function.
  passHiddenValues(foodIdentity){
    let result = null;
    this.foods.map ((food) => {
      if (this.foods.indexOf(food) === foodIdentity) {
        const digits = /([0-9]*[.])?[0-9]+/;
        result = {
          unit: food.unit,
          calories: Number(food.calories.match(digits)[0]),
          fat: Number(food.fat.match(digits)[0]),
          carbs: Number(food.carbs.match(digits)[0]),
          protein: Number(food.protein.match(digits)[0])
        }
      }
    });
    return result;
  }
}
