
function randDigit(min, max) {
	return Math.floor(Math.random() * (max-min + 1) + min);
}

function randomizeArray(array) {
	var newArr = [],
			index;
	while(array.length > 0) {
		index = randDigit(0, (array.length - 1));
		newArr.push(array[index]);
		array.splice(index, 1);
	}
	return newArr;
}

// In game, allow for option of simple addition, double digit addition, or range.
// For single and double, just enter the range for the user

// Returns two numbers within range, their sum, and an array
// of given length of false possible solutions plus the correct solution
// Checks for possible solutions:  must be greater than the larger of the addends
//   and must be unique solutions
function createAdditionProblem(numPossibleSolutions, minDigit, maxDigit) {
	var possibleSolution,
			possibleSolutions = [],
			num1 = randDigit(minDigit, maxDigit),
			num2 = randDigit(minDigit, maxDigit),
			sum = num1 + num2;
	possibleSolutions.push(sum);
	for(i=0; i<numPossibleSolutions-1; i++) {
		do {
			possibleSolution = randDigit(minDigit, maxDigit) + randDigit(minDigit, maxDigit);
		} while ((possibleSolution <= Math.max(num1, num2)) || (possibleSolutions.indexOf(possibleSolution) != -1));
		possibleSolutions.push(possibleSolution);
	}
	possibleSolutions = randomizeArray(possibleSolutions);
	return {num1: num1, num2: num2, operation: '+', answer: sum, choices: possibleSolutions};
}

// Returns two numbers within range, their difference, and an array
// of given length of false possible solutions plus the correct solution
// Checks for possible solutions:  must be less than the larger of the numbers,
//   must be greater than zero, and must be unique solutions
function createSubtractionProblem(numPossibleSolutions, minDigit, maxDigit) {
	var possibleSolution,
			possibleSolutions = [],
			num1 = randDigit(minDigit, maxDigit),
			num2 = randDigit(minDigit, maxDigit),
			temp;
	if (num2 > num1) {
		temp = num1;
		num1 = num2;
		num2 = temp;
	}
	var difference = num1 - num2;
	possibleSolutions.push(difference);
	for(i=0; i<numPossibleSolutions-1; i++) {
		do {
			possibleSolution = randDigit(minDigit, maxDigit) - randDigit(minDigit, maxDigit);
		} while ((possibleSolution >= Math.max(num1, num2)) || (possibleSolution < 0) || (possibleSolutions.indexOf(possibleSolution) != -1));
		possibleSolutions.push(possibleSolution);
	}
	possibleSolutions = randomizeArray(possibleSolutions);
	return {num1: num1, num2: num2, operation: '-', answer: difference, choices: possibleSolutions};
}

// Returns two numbers within range, their produce, and an array
// of given length of false possible solutions plus the correct solution
// Checks for possible solutions:  must be less than the larger of the numbers,
//   must be greater than zero, and must be unique solutions
function createMultiplicationProblem(numPossibleSolutions, minDigit, maxDigit) {
	var possibleSolution,
			possibleSolutions = [],
			num1 = randDigit(minDigit, maxDigit),
			num2 = randDigit(minDigit, maxDigit);
	while (num1 === 1 && num2 === 1) {
		num2 = randDigit(minDigit, maxDigit);
	}
	var product = num1 * num2;
	possibleSolutions.push(product);
	while(possibleSolutions.length < numPossibleSolutions) {
		possibleSolution = Math.round(product*(Math.random() + 0.5));
		if(possibleSolutions.indexOf(possibleSolution) === -1) {
			possibleSolutions.push(possibleSolution);
		}
	}
	possibleSolutions = randomizeArray(possibleSolutions);
	return {num1: num1, num2: num2, operation: String.fromCharCode(215), answer: product, choices: possibleSolutions};
}

// Returns two numbers, their quotient, and an array of given length of false 
// possible solutions plus the correct solution. Checks for possible solutions:
//   must be unique solutions
function createSimpleDivisionProblem(numPossibleSolutions) {
	var num1,
			possibleSolution,
			possibleSolutions = [],
			num2 = randDigit(1, 9);
	quotient = randDigit(0, 9);
	num1 = quotient * num2;
	possibleSolutions.push(quotient);
	while(possibleSolutions.length < numPossibleSolutions) {
		possibleSolution = randDigit(1, 9);
		if (possibleSolutions.indexOf(possibleSolution) === -1) {
			possibleSolutions.push(possibleSolution);
		}
	}
	possibleSolutions = randomizeArray(possibleSolutions);
	return {num1: num1, num2: num2, operation: String.fromCharCode(247), answer: quotient, choices: possibleSolutions};
}