LANGUAGES = { [0]: 'american', [1]: 'french', [2]: 'german', [3]: 'italian', [4]: 'spanish', [5]: 'brazilian', [6]: 'polish', [7]: 'russian', [8]: 'korean', [9]: 'chinesetrad', [10]: 'japanese', [11]: 'spanish', [12]: 'chinesesimp' }
SELECTED_LANGUAGE = LANGUAGES[GetCurrentLanguage()] || 'american'
REGISTERED_LANGUAGES = {}

DEBUG_ENABLED = true

GetLanguage = () => {
    return SELECTED_LANGUAGE
}
exports('GetLanguage', GetLanguage)

AddLanguage = (lang, phrases) => {
    if (REGISTERED_LANGUAGES[lang]) {
        return
    }

    REGISTERED_LANGUAGES[lang] = phrases

    if (DEBUG_ENABLED) {
        console.log('New language added: '+ lang +'.')
    }
}
exports('AddLanguage', AddLanguage)

GetPhrase = (phrase) => {
    if (SELECTED_LANGUAGE && REGISTERED_LANGUAGES[SELECTED_LANGUAGE]) {
        if (REGISTERED_LANGUAGES[SELECTED_LANGUAGE][phrase]) {
            return REGISTERED_LANGUAGES[SELECTED_LANGUAGE][phrase]
        }
    }
}
exports('GetPhrase', GetPhrase)

if (DEBUG_ENABLED) {
    RegisterCommand('phrase', () => { // example
        let language = GetLanguage()
        let phrase = GetPhrase('hello')
    
        console.log(language)
        console.log(phrase)
    })
}