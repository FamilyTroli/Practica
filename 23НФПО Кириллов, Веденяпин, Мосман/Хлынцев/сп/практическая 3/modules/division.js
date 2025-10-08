const division = (numbers) => {
    return numbers.reduce((acc, number) => {
        return acc / number;
    }, numbers[0]);
}

export default division;