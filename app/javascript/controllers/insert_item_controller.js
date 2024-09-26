import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fullContent", "container"]


  connect(){
    this.initialContent = this.fullContentTarget.outerHTML;
    this.count = 0
  }
  // Insert new fields to user add more items
  insert(event){
    const fullContent = this.initialContent;
    const container = this.containerTarget;
    container.insertAdjacentHTML("beforeend",
      `${fullContent}`
    );
    this.updateAttributes()
  }

  //Update attributes in order to differentiate the dinamic fields.
  updateAttributes(){
    this.count += 1

    const items = [
      "name",
      "calories",
      "protein",
      "carbs",
      "fat"
    ]

    for (const item of items) {
      console.log(`meal_meal_items_attributes_0_item_attributes_${item}`);
      const field = document.getElementById(`meal_meal_items_attributes_0_item_attributes_${item}`);
      console.log(field)
      field.name = `meal[meal_items_attributes][${this.count}][item_attributes][${item}]`;
      field.id = `meal_meal_items_attributes_${this.count}_item_attributes_${item}`;
    }

    let qtyField = document.getElementById("meal_meal_items_attributes_0_qty");
    qtyField.name = `meal[meal_items_attributes][${this.count}][qty]`;
    qtyField.id = `meal_meal_items_attributes_${this.count}_item_attributes_qty`;
    let measureField = document.getElementById("meal_meal_items_attributes_0_measure_unit");
    measureField.name = `meal[meal_items_attributes][${this.count}][measure_unit]`;
    measureField.id = `meal_meal_items_attributes_${this.count}_item_attributes_measure_unit`;
  }
}
