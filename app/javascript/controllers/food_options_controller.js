import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "calories", "options", "searchButton", "qty", "measureUnit"]

  connect(){
    this.count = 1;
  }


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

  displayOptions(data) {
    const displayArea = this.optionsTarget;
    displayArea.innerHTML = "";
    const options = this.createOptions(data);
    displayArea.insertAdjacentHTML("beforeend",
      `${options}`
    );
  }

  createOptions(foods){
    let listContent = " ";
    foods.forEach((food) => {
      const foodName = food.food_name;
      const unit = food.unit
      const cal = food.calories
      listContent += `<button type="button" class="list-group-item list-group-item-action">${foodName} - ${unit} - ${cal}</button>`;
  });
  const finalContent = `<div class="list-group">${listContent}</div>`;
  return finalContent
  }

  select(event) {
    let nameValue = this.nameTarget.value
    nameValue = event.target.innerHTML;
    console.log(nameValue);
    const values = this.passHiddenValues(nameValue);
    console.log(values);
    this.optionsTarget.innerHTML = "";
  }

  passHiddenValues(nameValue){
    this.foods.map ((food) => {
      if (food.food_name === nameValue) {
        result = {
          unit: food.unit,
          calories: food.calories,
          fat: food.fat,
          carbs: food.carbs,
          protein: food.protein
        }
      }
    });
  }
}
