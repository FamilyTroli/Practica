const h1 = document.querySelector('#h1');
const p = document.querySelector('#p');

const alphabet = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
    'u', 'v', 'w', 'x', 'y', 'z'
];

const getRandomSymbol = (min, max) => {
    const randomNumber = Math.floor(min + Math.random() * (max - min + 1));
    return alphabet[randomNumber];
}

const getIsUpper = (char) => {
    const charUpper = char.toUpperCase();
    return charUpper === char;
}

const check = (chars) => {
    char1 = chars[0];
    char2 = chars[1];
    char3 = chars[2];

    if (getIsUpper(char1) && !getIsUpper(char2) && getIsUpper(char3)) return true;
    else if (!getIsUpper(char1) && getIsUpper(char2) && !getIsUpper(char3)) return true;
    else return false;
}

let randomChars = '';
for (let i = 0; i < 3; i++) {
    randomChars += getRandomSymbol(0, alphabet.length - 1);
}

p.textContent = randomChars;
h1.textContent = check(randomChars) ? 'ТВОИ БУКАВЕ ЧЕРЕДОВАТЬСЯ ДЕЛАТЬ' : 'ТВОИ БУКАВЕ НЕ ДЕЛАТЬ ЧЕРЕДОВАТЬ';