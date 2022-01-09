LANGUAGES = { [0] = 'american', [1] = 'french', [2] = 'german', [3] = 'italian', [4] = 'spanish', [5] = 'brazilian', [6] = 'polish', [7] = 'russian', [8] = 'korean', [9] = 'chinesetrad', [10] = 'japanese', [11] = 'mexican', [12] = 'chinesesimp' }
REGISTERED_LANGUAGES = {}
SELECTED_LANGUAGE = LANGUAGES[0]

DEBUG_ENABLED = true -- Set to false if you dont want any info prints.

function ADD_LANG(lang, phrases)
    if not REGISTERED_LANGUAGES[lang] then
        REGISTERED_LANGUAGES[lang] = phrases

        if DEBUG_ENABLED then
            print('New language added: %s'):format(lang)
        end
    end
end

function ADD_PHRASE(lang, name, phrase)
    if not lang then
        lang = SELECTED_LANGUAGE
    end

    if not REGISTERED_LANGUAGES[lang][name] then
        REGISTERED_LANGUAGES[lang][name] = phrase

        if DEBUG_ENABLED then
            print('New phrase added "%s": %s'):format(name, phrase)
        end
    end
end

function GET_PHRASE(name)
    if SELECTED_LANGUAGE and REGISTERED_LANGUAGES[SELECTED_LANGUAGE] then
        if REGISTERED_LANGUAGES[SELECTED_LANGUAGE][name] then
            return tostring(REGISTERED_LANGUAGES[SELECTED_LANGUAGE][name])
        end
    end
end

Citizen.CreateThread(function()
    local lang = GetCurrentLanguage()

    if LANGUAGES[lang] then
        SELECTED_LANGUAGE = LANGUAGES[lang]
    end
end)