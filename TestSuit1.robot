*** Settings ***
Library           SeleniumLibrary

*** Variables ***

${BROWSER}        chrome
${URL}            https://www.google.com/
${USERNAME}       user@gmail.com
${PASSWORD}       1234567809
${MESSAGE}        Salut tout le monde

*** Test Cases ***
Access Google and Click on First Facebook Result
    Open Browser    ${URL}    ${BROWSER}      # Ouvre le navigateur Chrome avec l'URL de Google
    Maximize Browser Window      # Agrandit la fenêtre du navigateur
    Title Should Be    Google    # Vérifie que la page affichée est Google
    Click Button  id=L2AGLb       # Accepter les cookies
    Input Text    name=q    Facebook     # Saisit "Facebook" dans la barre de recherche de Google
    Press Keys    name=q    RETURN       # Appuie sur la touche Entrée pour effectuer la recherche
    Wait Until Page Contains Element    css=.g     # Attend que la page des résultats de recherche soit chargée
    Click Element    css=.g:first-child a          # Clique sur le premier résultat de la recherche
    click Button  id=u_0_e_Gi
    #Remplir les champs email et mot de passe avec les valeurs stockées dans les variables USERNAME et PASSWORD
    Input Text    name=email    ${USERNAME}
    Input Text    name=pass    ${PASSWORD}
    # Cliquer sur le bouton de connexion de Facebook
    Click Button    css=#loginbutton
    # Attendre que la page contienne l'élément de bienvenue "fbxWelcomeBoxName"
    Wait Until Page Contains    css=.fbxWelcomeBoxName
    # Attendre que la page contienne l'élément "facebook"
    Wait Until Page Contains Element    css=#facebook
    # Cliquer sur l'élément "facebook"
    Click Element    css=#facebook
    # Attendre que la page contienne l'élément "Créer une publication"
    Wait Until Page Contains Element    css=[aria-label="Créer une publication"]
    # Cliquer sur l'élément "Créer une publication"
    Click Element    css=[aria-label="Créer une publication"]
    # Attendre que la page contienne l'élément qui permet de publier un message
    Wait Until Page Contains Element    css=[role="dialog"] [contenteditable="true"]
    # Remplir l'élément qui permet de publier un message avec la valeur stockée dans la variable MESSAGE
    Input Text    css=[role="dialog"] [contenteditable="true"]    ${MESSAGE}
    # Cliquer sur le bouton de publication
    Click Button    css=[data-testid="react-composer-post-button"]

