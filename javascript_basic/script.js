/** Uncomment the code before executing
 * To uncomment the code just remove // before line 
 */

/** Show alert message on browser */
// alert("JavaScript loaded");


/** Variable and constant declaration */
// var teaType = "Green Tea";      // String
// let teaTemperature = 70;        // Number
// let teaSweetness = "mild";      // String
// let sugar = false;              // Boolean
// const teaPrice = 2;             // Number


/** Variable re-assignemnt and log to browser console */
// console.log(teaType);
// teaType = "Hearbal tea";
// console.log(teaType);
// teaPrice = 3;
// console.log(teaPrice);

// console.log("The total cost of " + numTeas + " " + teaType + " teas is $" + totalCost + ".");



/** Conditional Statement */
// let desiredTemperature = 60;
// teaTemperature = 50;
// let temperatureDifference = teaTemperature - desiredTemperature;
// let coolingRate = 0.5; // degrees per minute
// let timeToCool = temperatureDifference / coolingRate;

// if (teaTemperature > desiredTemperature) {
//     console.log("Tea is too hot. Please wait a few minutes and try again.");
// } else if (teaTemperature <= desiredTemperature) {
//     console.log("Tea temperature is just right.");
// } else {
//     console.log("Tea tempreture is bellow than desired temprature");
// }

// let numTeas = 10;
// let totalCost = teaPrice * numTeas;

// let discountPercentage = 0;

// if (numTeas >= 5) {
//   discountPercentage = 0.1;
// }

// let discountAmount = totalCost * discountPercentage;
// let finalCost = totalCost - discountAmount;

// console.log("The final cost of the order is $" + finalCost + " with a discount of $" + discountAmount + ".");

/*
if (teaTemperature > desiredTemperature) {
    console.log("Your tea is too hot, it needs to cool down further.");
  } else if (teaTemperature < desiredTemperature) {
    console.log("Your tea is too cold, it needs to be heated up.");
  } else {
    console.log("Your tea is at the desired temperature.");
  }
*/


/** Switch Statement */
// teaType = "herbal";

// switch (teaType) {
//     case "black":
//         console.log("You ordered a cup of black tea.");
//         break;
//     case "green":
//         console.log("You ordered a cup of green tea.");
//         break;
//     case "herbal":
//         console.log("You ordered a cup of herbal tea.");
//         break;
//     default:
//         console.log("This type of tea is not available.");
//         break;
// }



/** Loops and Array */
// for (let i = 1; i <= 10; i++) {
//     console.log(i);
// }

// let teaTypes = ["Black tea", "Green tea", "Chai tea"];

// console.log(teaTypes[0])     // Black tea
// console.log(teaTypes[1])     // Green tea
// console.log(teaTypes[2])    // Chai tea

// teaTypes[1] = "Herbal tea";

// console.log(teaTypes);


// let teaTypes = ["Black tea", "Green tea", "Chai tea"];

// Instead we can simply write a loop
// for (let i = 0; i < teaTypes.length; i++) {
//     let teaType = teaTypes[i];
//     console.log(i, teaType);
// }



/** Functions */
// function calculateCost(price, quantity) {
//     return price * quantity;
// }

// let teaPrice = 2;
// let numTeas = 3;

// let totalCost = calculateCost(teaPrice, numTeas);

// console.log('Total Cost is $' + totalCost);



// let desiredTemprature = 70;
// let teaTemprature = 75;

// function updateTemprature(currentTemprature, desiredTemprature) {
//     let coolingRate = 0.5;

//     if (currentTemprature > desiredTemprature) {
//         return currentTemprature - coolingRate;
//     } else if (currentTemprature < desiredTemprature) {
//         return currentTemprature + coolingRate;
//     } else {
//         return currentTemprature;
//     }
// }


// while (teaTemprature !== desiredTemprature) {
//     console.log("Current temprature is " + teaTemprature);
//     teaTemprature = updateTemprature(teaTemprature, desiredTemprature);
// }

// console.log("Current temprature is " + teaTemprature);



/** Objects */
// let person = {
//     name: "Kamran",
//     age: 28,
//     gender: "Male"
// }


var teaMenu = {
    greenTea: {
      name: "Green Tea",
      price: 2,
      ingredients: ["green tea leaves", "water"],
      description: "A refreshing and healthy tea made from green tea leaves and water."
    },
    herbalTea: {
      name: "Herbal Tea",
      price: 4,
      ingredients: ["herbs", "water"]
    }
};

console.log(teaMenu.herbalTea.price);