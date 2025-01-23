return {
    Generate = {
        prompt = {
            en = "$input",
            es = "$input",
        },
        replace = true,
    },
    Chat = {
        prompt = {
            en = "$input",
            es = "$input",
        },
    },
    Summarize = {
        prompt = {
            en = "Summarize the following text:\n$text",
            es = "Resume el siguiente texto:\n$text",
        },
    },
    Ask = {
        prompt = {
            en = "Regarding the following text, $input:\n$text",
            es = "Con respecto al siguiente texto, $input:\n$text",
        },
    },
    Change = {
        prompt = {
            en = "Change the following text, $input, just output the final text without additional quotes around it:\n$text",
            es = "Cambia el siguiente texto, $input, solo muestra el texto final sin comillas adicionales alrededor:\n$text",
        },
        replace = true,
    },
    Enhance_Grammar_Spelling = {
        prompt = {
            en = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
            es = "Modifica el siguiente texto para mejorar la gramática y la ortografía, solo muestra el texto final sin comillas adicionales alrededor:\n$text",
        },
        replace = true,
    },
    Enhance_Wording = {
        prompt = {
            en = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
            es = "Modifica el siguiente texto para usar una mejor redacción, solo muestra el texto final sin comillas adicionales alrededor:\n$text",
        },
        replace = true,
    },
    Make_Concise = {
        prompt = {
            en = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
            es = "Modifica el siguiente texto para que sea lo más simple y conciso posible, solo muestra el texto final sin comillas adicionales alrededor:\n$text",
        },
        replace = true,
    },
    Make_List = {
        prompt = {
            en = "Render the following text as a markdown list:\n$text",
            es = "Renderiza el siguiente texto como una lista en formato markdown:\n$text",
        },
        replace = true,
    },
    Make_Table = {
        prompt = {
            en = "Render the following text as a markdown table:\n$text",
            es = "Renderiza el siguiente texto como una tabla en formato markdown:\n$text",
        },
        replace = true,
    },
    Review_Code = {
        prompt = {
            en = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
            es = "Revisa el siguiente código y haz sugerencias concisas:\n```$filetype\n$text\n```",
        },
    },
    Enhance_Code = {
        prompt = {
            en = "Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
            es = "Mejora el siguiente código, solo muestra el resultado en formato ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        },
        replace = true,
        extract = "```$filetype\n(.-)```",
    },
    Change_Code = {
        prompt = {
            en = "Regarding the following code, $input, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
            es = "Con respecto al siguiente código, $input, solo muestra el resultado en formato ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        },
        replace = true,
        extract = "```$filetype\n(.-)```",
    },
}
