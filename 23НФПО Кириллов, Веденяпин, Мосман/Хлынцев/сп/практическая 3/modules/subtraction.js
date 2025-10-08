const subtraction = (numbers) => {
    return numbers.reduce((acc, number) => {
        return acc - number;
    }, 0);
}

export default subtraction;