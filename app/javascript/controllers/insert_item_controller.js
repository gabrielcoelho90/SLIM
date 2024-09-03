import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fullContent", "container"]


  connect(){
    this.initialContent = this.fullContentTarget.outerHTML;
    this.count = 0
  }

  insert(event){
    const fullContent = this.initialContent;
    const container = this.containerTarget;
    container.insertAdjacentHTML("beforeend",
      `${fullContent}`
    );
    this.updteAttributes()
  }

  updteAttributes(){
    this.count += 1
    let nameField = document.getElementById("meal_meal_items_attributes_0_item_attributes_name");
    nameField.name = `meal[meal_items_attributes][${this.count}][item_attributes][name]`;
    nameField.id = `meal_meal_items_attributes_${this.count}_item_attributes_name`;
    let qtyField = document.getElementById("meal_meal_items_attributes_0_qty");
    qtyField.name = `meal[meal_items_attributes][${this.count}][item_attributes][qty]`;
    qtyField.id = `meal_meal_items_attributes_${this.count}_item_attributes_qty`;
    let measureField = document.getElementById("meal_meal_items_attributes_0_measure_unit");
    measureField.name = `meal[meal_items_attributes][${this.count}][item_attributes][measure_unit]`;
    measureField.id = `meal_meal_items_attributes_${this.count}_item_attributes_measure_unit`;
    let calField = document.getElementById("meal_meal_items_attributes_0_item_attributes_calories");
    calField.name = `meal[meal_items_attributes][${this.count}][item_attributes][calories]`;
    calField.id = `meal_meal_items_attributes_${this.count}_item_attributes_calories`;
    let unitField = document.getElementById("meal_meal_items_attributes_0_item_attributes_unit");
    unitField.name = `meal[meal_items_attributes][${this.count}][item_attributes][unit]`;
    unitField.id = `meal_meal_items_attributes_${this.count}_item_attributes_unit`;
    let proteinField = document.getElementById("meal_meal_items_attributes_0_item_attributes_protein");
    proteinField.name = `meal[meal_items_attributes][${this.count}][item_attributes][protein]`;
    proteinField.id = `meal_meal_items_attributes_${this.count}_item_attributes_protein`;
    let carbsField = document.getElementById("meal_meal_items_attributes_0_item_attributes_carbs");
    carbsField.name = `meal[meal_items_attributes][${this.count}][item_attributes][carbs]`;
    carbsField.id = `meal_meal_items_attributes_${this.count}_item_attributes_carbs`;
    let fatField = document.getElementById("meal_meal_items_attributes_0_item_attributes_fat");
    fatField.name = `meal[meal_items_attributes][${this.count}][item_attributes][fat]`;
    fatField.id = `meal_meal_items_attributes_${this.count}_item_attributes_fat`;
  }
}
