import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "calories","protein", "carbs", "fat", "options", "searchButton", "qty", "measureUnit"]

  connect(){
    this.count = 1;
  }

  //AJAX
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
        console.log(this.foods);
      });
  }

  //Display food options
  displayOptions(data) {
    const displayArea = this.optionsTarget;
    displayArea.innerHTML = "";
    const options = this.createOptions(data);
    displayArea.insertAdjacentHTML("beforeend",
      `${options}`
    );
  }
  // Create customized options of user's item
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

  // Track wich food option user has chosen
  select(event) {
    const foodChosen = event.target
    const newValue = foodChosen.innerHTML;
    this.nameTarget.value = newValue;
    console.log(foodChosen);
    const foodChosenIdentity = Number(foodChosen.dataset.identity);
    console.log(foodChosenIdentity);
    const hiddenInputs = this.passHiddenValues(foodChosenIdentity);
    this.caloriesTarget.value = hiddenInputs.calories;
    this.proteinTarget.value = hiddenInputs.protein
    this.carbsTarget.value = hiddenInputs.carbs
    this.fatTarget.value = hiddenInputs.fat
    console.log(hiddenInputs.calories)
    this.optionsTarget.innerHTML = "";
  }

  // From user's choice get, match it with my response from AJAX in order to
  //get the correct calories, fat , etc from that item and return an object.
  passHiddenValues(foodIdentity){
    let result = null;
    this.foods.map ((food) => {
      if (this.foods.indexOf(food) === foodIdentity) {
        console.log("true")
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
