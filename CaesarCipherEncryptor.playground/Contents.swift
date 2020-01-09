func caesarCipherEncryptor(string: String, key: Int) -> String {
    // Write your code here.
    
    let newKey = key % 26
    var newLetterCode = [Character]()
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    for letter in string {
        newLetterCode.append(getNewLetterCode(letter, alphabet, newKey))
    }
    return String(newLetterCode)
}

func getNewLetterCode(_ letter: Character, _ aphabet: [Character], _ key: Int) -> Character {
    let newLetterCode = aphabet.firstIndex(of: letter)! + key
    if newLetterCode <= 25 {
        return aphabet[newLetterCode]
    }
    else {
        return aphabet[-1 + newLetterCode % 25]
    }
}


