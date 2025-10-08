import { sum, subtraction, division, multiplication } from "./modules/index.js";

const numbers = [1, 2, 3, 4, 5];

const main = () => {
    console.log('Выполнение операций с числами:');

    console.log(`Операция суммирования: ${sum(numbers)}`);
    console.log(`Операция вычитания: ${subtraction(numbers)}`);
    console.log(`Операция деления: ${division(numbers)}`);
    console.log(`Операция умножения: ${multiplication(numbers)}`);
}

main();