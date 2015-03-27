@ECHO OFF

:start
CLS
ECHO.
ECHO ===Gestionnaire de hotspot wifi Batspot 1.0===
ECHO. 
ECHO c. Cr‚er un nouvel hotspot
ECHO d. Supprimer le hotspot
ECHO.
ECHO 1. D‚marrer le hotspot
ECHO 2. Arrˆter le hotspot
ECHO 3. Status du hotspot
ECHO.
ECHO q. Quitter
ECHO.
ECHO.
set choice=
set /p choice=Entrez votre choix puis appuyez sur entr‚e : 
if "%choice%"=="" goto errornothing
if "%choice%"=="c" goto hotspotcreate
if "%choice%"=="d" goto hotspotdeleteprompt
if "%choice%"=="1" goto hotspotstart
if "%choice%"=="2" goto hotspotstop
if "%choice%"=="3" goto hotspotstatus
if "%choice%"=="q" goto end
set choice=
goto error

:error
ECHO.
ECHO "%choice%" n'est pas valide, r‚essayer
ECHO.
pause
goto start

:errornothing
ECHO.
ECHO Erreur: Veuillez entrer un chiffre pour faire votre choix, r‚essayer
ECHO.
pause
goto start

:errornothing2
ECHO.
ECHO Erreur: Veuillez entrer un "o" ou "n" pour faire votre choix, r‚essayer
ECHO.
pause
goto start

:errornothing3
ECHO.
ECHO Erreur: Vous n'avez pas defini de SSID, r‚essayer
ECHO.
pause
goto hotspotcreate

:errornothing4
ECHO.
ECHO Erreur: Vous n'avez pas defini de cl‚ WPA, r‚essayer
ECHO.
pause
goto hotspotcreate

:hotspotcreate
CLS
ECHO.
ECHO ===Configuration d'un nouvel hotspot wifi===
ECHO. 
ECHO Cet assistant va vous aider a cr‚er un hotspot wifi s‚curis‚ (WPA/WPA2)
ECHO. 
ECHO Pour cr‚er un nouvel hotspot, il faut d‚finir son SSID (nom affich‚) et sa cl‚ WPA (mot de passe)
ECHO. 
ECHO La cl‚ WPA doit comporter entre 8 et 63 characteres
ECHO. 
set /p ssid=Entrez le SSID : 
if "%ssid%"=="" goto errornothing3
set wpa=
set /p wpa=Entrez la cl‚ WPA : 
if "%wpa%"=="" goto errornothing4 
ECHO.
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%wpa%"
ECHO.
ECHO.
ECHO Souhaitez-vous d‚marrer le hotspot cr‚‚ ? 
ECHO.
ECHO o. Oui
ECHO n. Non
ECHO.
set choice=
set /p choice=Entrez votre choix puis appuyez sur entr‚e : 
if "%choice%"=="" goto errornothing2
if "%choice%"=="o" goto hotspotstart
if "%choice%"=="n" goto start
goto error

:hotspotdeleteprompt
cls
ECHO.
ECHO Souhaitez-vous supprimer la configuration du hotspot ? 
ECHO.
ECHO o. Oui
ECHO n. Non
ECHO.
set choice=
set /p choice=Entrez votre choix puis appuyez sur entr‚e : 
if "%choice%"=="" goto errornothing2
if "%choice%"=="o" goto hotspotdelete
if "%choice%"=="n" goto start
goto error

:hotspotdelete
ECHO.
netsh wlan set hostednetwork mode=disallow
ECHO.
pause
goto start

:hotspotstart
ECHO.
netsh wlan start hostednetwork
ECHO.
pause
goto start

:hotspotstop
ECHO.
netsh wlan stop hostednetwork
ECHO.
pause
goto start

:hotspotstatus
ECHO.
netsh wlan show hostednetwork
ECHO.
pause
goto start

:end
ECHO.
ECHO Bye !
ECHO.
ECHO --Cr‚‚ par The Black Hole (@theblackhole08)
ECHO.
timeout /t 5
exit