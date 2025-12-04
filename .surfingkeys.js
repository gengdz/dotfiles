// an example to create a new mapping `ctrl-y`
api.mapkey("<ctrl-y>", "Show me the money", function () {
  api.Front.showPopup(
    "a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).",
  );
});

settings.defaultLLMProvider = "custom";
settings.llm = {
  custom: {
    serviceUrl:
      "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions",
    apiKey: "sk-9a02e9141684451eb2d1437451087b57",
    model: "qwen3-coder-plus",
  },
};

api.mapkey("g1", "go to tab #1", function () {
  api.Normal.feedkeys("1T");
});
api.mapkey("g2", "go to tab #2", function () {
  api.Normal.feedkeys("2T");
});
api.mapkey("g3", "go to tab #3", function () {
  api.Normal.feedkeys("3T");
});
api.mapkey("g4", "go to tab #4", function () {
  api.Normal.feedkeys("4T");
});
api.mapkey("g5", "go to tab #5", function () {
  api.Normal.feedkeys("5T");
});
api.mapkey("g6", "go to tab #6", function () {
  api.Normal.feedkeys("6T");
});
api.mapkey("g7", "go to tab #7", function () {
  api.Normal.feedkeys("7T");
});
api.mapkey("g8", "go to tab #8", function () {
  api.Normal.feedkeys("8T");
});
api.mapkey("g9", "go to tab #9", function () {
  api.Normal.feedkeys("9T");
});

// an example to remove mapkey `Ctrl-i`
api.unmap("<ctrl-i>");

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map("gt", "T");
api.map("]b", "R");
api.map("[b", "E");
api.map("<Ctrl-o>", "S");
api.map("<Ctrl-i>", "D");
api.map("F", "af");

// settings.theme = `
// .sk_theme .separator {
//     color: bisque;
// }
// #sk_omnibarSearchArea {
//     padding: 8px 0;
//     border-bottom: none;
// }
// #sk_status {
//     border: none;
//     span:nth-of-type(1) {
//         display: none;
//     };
//     span:nth-of-type(2) {
//         line-height: 24px;
//         padding: 0 !important;
//     }
// }
// `;

// background: initial;
// background: #272822;  #F92660;"
api.Hints.style(`
    border: solid 1px #3D3E3E;
    color: #b16286;
    background: rgba(38,39,57);
    font-family: Maple Mono Freeze;
    box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.8);
`);

api.Hints.style(
  `
    border: solid 1px #3D3E3E !important;
    padding: 1px !important;
    color: #A6E22E !important;
    background: #272822 !important;
    font-family: Maple Mono Freeze !important;
    box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.8) !important;
`,
  "text",
);

api.Visual.style("marks", "background-color: #A6E22E99;");
api.Visual.style("cursor", "background-color: #F92660;");

/* set theme */
settings.theme = `
.sk_theme {
    font-family: Maple Mono Freeze,Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: rgba(38,39,57);
    color: #ebdbb2;

    & tbody {
        color: #b8bb26;
    }
    & input {
        color: #d9dce0;
    }
    & .url {
        color: #38971a;
    }
    & .annotation {
        color: #b16286;
    }
    & .omnibar_highlight {
        color: #ebdbb2;
    }
    & #sk_omnibarSearchResult {
        max-height: 60vh;
        overflow: hidden;
        margin: 0rem 0rem;

        ul li:nth-child(odd) {
            background: rgba(38,39,57,0.8);
        }
        ul li {
            margin-block: 0.5rem;
            padding-left: 0.4rem;
        }
        ul li.focused {
            background: #181818;
            border-color: #181818;
            border-radius: 12px;
            position: relative;
            box-shadow: 1px 3px 5px rgba(0, 0, 0, 0.8);
        }
    }

    & .separator {
        color: rgba(38,39,57);
    }
    & .prompt {
        color: #aaa;
        background-color: #181818;
        border-radius: 10px;
        padding-left: 22px;
        padding-right: 21px;
        /* padding: ; */
        font-weight: bold;
        box-shadow: 1px 3px 5px rgba(0, 0, 0, 0.8);
    }
}

#sk_omnibar {
    width: 60%;
    left: 20%;
    box-shadow: 0px 30px 50px rgba(0, 0, 0, 0.8);
    padding: 10px 0;
}

.sk_omnibar_middle {
    top: 15%;
    border-radius: 10px;
}

#sk_omnibarSearchResult > ul {
    padding: 1.0em;
}

#sk_omnibarSearchArea > input {
    display: inline-block;
    width: 100%;
    flex: 1;
    font-size: 20px;
    margin-bottom: 0;
    padding: 0px 0px 0px 0.5rem;
    background: transparent;
    border-style: none;
    outline: none;
    padding-left: 18px;
}

#sk_tabs {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 10px;
    padding: 10px;
    background: transparent;
padding: 10px;
    position: fixed;
    top: 0;
    left: 0;
    overflow: auto;
    z-index: 2147483000;
    margin-left: 1rem;
    margin-top: 1.5rem;

    & div.sk_tab {
padding: 10px;
    border-radius: 4px;
        vertical-align: bottom;
        justify-items: center;
        border-radius: 8px;
        background: rgba(38,39,57);
     box-shadow: 0px 30px 50px rgba(0, 0, 0, 0.8);

        margin: 0px;
        box-shadow: 0px 0px 0px 0px rgba(245, 245, 0, 0.3);
        box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.8) !important;

        /* padding-top: 2px; */
        border-top: solid 0px black;
        margin-block: 0rem;
    }

    // & div.sk_tab:not(:has(.sk_tab_hint)) {
    //     background-color: #181818 !important;
    //     box-shadow: 1px 3px 5px rgba(0, 0, 0, 0.8) !important;
    //     border: 1px solid #181818;
    //     border-radius: 20px;
    //     position: relative;
    //     z-index: 1;
    //     margin-left: 1.8rem;
    //     padding-left: 0rem;
    //     margin-right: 0.7rem;
    // }

    & div.sk_tab_title {
        display: inline-block;
        vertical-align: middle;
        font-size: 10pt;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        padding-left: 5px;
        color: #ebdbb2;
    }

    &.vertical {
        & div.sk_tab_hint {
            position: inherit;
            left: 8pt;
            margin-top: 3px;
            border: solid 1px #3D3E3E;
            color: #F92660;
            background: initial;
            background-color: #272822;
            font-family: Maple Mono Freeze;
            box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.8);
        }

        & div.sk_tab_wrap {
            display: inline-block;
            margin-left: 0pt;
            margin-top: 0px;
            padding-left: 15px;
        }

        & div.sk_tab_title {
            min-width: 100pt;
            max-width: 20vw;
        }
    }
}

#sk_usage, #sk_popup, #sk_editor {
    overflow: auto;
    position: fixed;
    width: 80%;
    max-height: 80%;
    top: 10%;
    left: 10%;
    text-align: left;
    box-shadow: 0px 30px 50px rgba(0, 0, 0, 0.8);
    z-index: 2147483298;
    padding: 1rem;
    border: 1px solid rgba(38,39,57);
    border-radius: 10px;
}

#sk_keystroke {
    padding: 6px;
    position: fixed;
    float: right;
    bottom: 0px;
    z-index: 2147483000;
    right: 0px;
    background: rgba(38,39,57);
    color: #fff;
    border: 1px solid #181818;
    border-radius: 10px;
    margin-bottom: 1rem;
    margin-right: 1rem;
    box-shadow: 0px 30px 50px rgba(0, 0, 0, 0.8);
}

#sk_status {
    position: fixed;
    /* top: 0; */
    bottom: 0;
    right: 39%;
    z-index: 2147483000;
    padding: 8px 8px 4px 8px;
    border-radius: 5px;
    border: 1px solid rgba(38,39,57);
    font-size: 12px;
    box-shadow: 0px 20px 40px 2px rgba(0, 0, 0, 1);
    /* margin-bottom: 1rem; */
    width: 20%;
    margin-bottom: 1rem;

    & span[style*="border-right: 1px solid rgb(153, 153, 153);"] {
        display: none;
    }
}

#sk_omnibarSearchArea {
    border-bottom: 0px solid rgba(38,39,57);

    & .resultPage {
        display: inline-block;
        font-size: 12pt;
        font-style: italic;
        width: auto;
    }
}

#sk_omnibarSearchResult li div.url {
    font-weight: normal;
    white-space: nowrap;
    color: #aaa;
}

.sk_theme .omnibar_highlight {
    color: #11eb11;
    font-weight: bold;
}

.sk_theme .omnibar_folder {
    border: 1px solid #188888;
    border-radius: 5px;
    background: #188888;
    color: #aaa;
    box-shadow: 1px 1px 5px rgba(0, 8, 8, 1);
}

.sk_theme .omnibar_timestamp {
    background: #cc4b9c;
    border: 1px solid #cc4b9c;
    border-radius: 5px;
    color: #aaa;
    box-shadow: 1px 1px 5px rgb(0, 8, 8);
}

#sk_omnibarSearchResult li div.title {
    text-align: left;
    max-width: 100%;
    white-space: nowrap;
    overflow: auto;
}

#sk_status, #sk_find {
    font-size: 10pt;
    font-weight: bold;
    text-align: center;
    padding-right: 8px;
}
`;
