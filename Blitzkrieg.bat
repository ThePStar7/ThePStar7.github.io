@echo off

set zyklonb=false

start /min sound.vbs

start credits.vbs

setlocal EnableDelayedExpansion

echo Achievement List >AchievementList.dll

:MainMenu

cls

title Blitzkrieg

echo _____________________________#####________________

echo __###____________________##############___________

echo __######################################__________

echo __###___________________###############___________

echo _______________################################___

echo __________##################__###################_

echo _________##################____###############_##_

echo _________##_################__###############_##__

echo _________###____#########################____##___

echo __________########______________________#####_____

echo ________________#########################_________

echo.

echo.

echo WELCOME TO BLITZKRIEG, THE FUN WAR SIMULATING GAME

echo 1) Start Game

echo 2) Start from Savefile

echo 3) Exit

echo.

set /p a=Choice: 

if %a%==1 goto start.new

if %a%==2 goto start.save

if %a%==3 goto extgame 

goto MainMenu

:extgame

start /min Kill.vbs

exit

:start.save

echo -Welcome Back! (Start the game from a savefile) >>AchievementList.dll

cls

echo Enter your Username

set /p username=

(

set /p ammo=

set /p gas=

set /p flammenwerfer=

set /p Wehrmachtsuniform=

set /p strength=

set /p money=

set /p panzer=

set /p respect=

set /p car=

set /p plane=

set /p year=

set /p memesaboutyou=

set /p deathsentence=

set /p rank=

)<%username%.sav

goto front.menu

:start.new

cls

title New Game

echo Blitzkrieg is a game made for Fun in Batch 

echo and is not affiliated with Hitler or 

echo the 3rd Reich.

echo. 

echo You Start off as a new Recruit for the

echo Wehrmacht and try to be the best soldier

echo of all time and defeat 'Murica and Britain 

echo So the 3rd Reich can last forever... 

pause

goto new.game

:new.game

cls

title New Game

echo Please choose a Username

set /p username=

echo Username Set!

echo Press Enter to start Game

pause >nul

goto setstatsnewgame

:setstatsnewgame

set ammo=0

set gas=0

set flammenwerfer=false

set Wehrmachtsuniform=false

set strength=50

set money=100

set panzer=false

set respect=21

set car=false

set plane=false

set year=1935

set memesaboutyou=0

set deathsentence=false

set rank=none

goto createsave

:createsave

if %username%==Hans set flammenwerfer=true

if not %username%==Hans set flammenwerfer=false

(

echo %ammo%

echo %gas%

echo %flammenwerfer%

echo %Wehrmachtsuniform%

echo %strength%

echo %money%

echo %panzer%

echo %respect%

echo %car%

echo %plane%

echo %year%

echo %memesaboutyou%

echo %deathsentence%

echo %rank%

)>%username%.sav

goto PreGameSettings

:PreGameSettings

::making the flamethrower unobtainable if your name is not Hans 

::asking for language

echo In which Language would you like to play?

echo Available Languages are:

echo English and German

Choice /C eg /M Choose

if errorlevel 2 goto lang.select.german

if errorlevel 1 goto lang.select.english

:lang.select.english

cls

title Blitzkrieg-English

echo So......

pause

echo You want to join ze Wehrmacht huh?

pause

:answer.here.m8

set /p introansweren=Say something: 

if %introansweren%==yes echo Zis is what i wanted to hear

if %introansweren%==ja echo Zis is what i wanted to hear

if %introansweren%==no (

echo NEIN NEIN NEIN

pause >nul

goto answer.here.m8

)

if %introansweren%==nein (

echo NEIN NEIN NEIN

pause

goto answer.here.m8

)

echo Well zen take zis Wehrmachtsuniform

set Wehrmachtsuniform=true

set rank=Mannschaft

echo -First Steps (Start game for the first time) >>AchievementList.dll

pause >nul

echo What are you waiting for??? Go to ze Front reich now

pause >nul

Choice /C yn /M Save?

if errorlevel 2 goto front.menu

if errorlevel 1 goto save.game

:save.game

(

echo %ammo%

echo %gas%

echo %flammenwerfer%

echo %Wehrmachtsuniform%

echo %strength%

echo %money%

echo %panzer%

echo %respect%

echo %car%

echo %plane%

echo %year%

echo %memesaboutyou%

echo %deathsentence%

echo %rank%

)>%username%.sav

goto front.menu

:front.menu

color 0f

cls

title Blitzkrieg-at ze Front

echo 1) Fight

echo 2) Inventory

echo 3) What year is it?

echo 4) Invade a country

echo 5) Switch Front

echo 6) Commit Suicide

echo 7) Map of invaded countries 

echo 8) Defeated Countries

echo 9) Meeting with SS

echo 10) Meeting with Wehrmacht

echo 11) Meeting with Hitler

echo 12) Supply Room

echo 13) Exit 

echo Ammo: %ammo%

echo Gas: %gas% liters

echo Rank: %rank% 

echo Flammenwerfer:

(

if %flammenwerfer%==true echo yes 

if not %flammenwerfer%==true echo no 

) 

set /p h=

if %h%==1 goto front.eng.fight

if %h%==2 goto front.eng.inventory

if %h%==3 goto front.eng.year

if %h%==4 goto front.eng.invade

if %h%==5 goto front.eng.switch

if %h%==6 goto front.eng.suicide

if %h%==7 goto front.eng.invadedmap

if %h%==8 goto front.eng.defeated

if %h%==9 goto front.eng.meet.ss

if %h%==10 goto front.eng.meet.wehrmacht

if %h%==11 goto front.eng.meet.hitler

if %h%==12 goto front.eng.supply

if %h%==13 goto MainMenu

goto front.menu

::######################## FRONT-KAMPF ANFANG ####################################################################

:front.eng.fight

echo FIGHT!!! (Start a fight) >>AchievementList.dll

cls

title Blitzkrieg-Fight

color 4f

echo Welcome to the Battlefield

echo.

echo What would you like to do?

echo.

echo -Attack (A)

echo -Call Airstrike (C)

echo -Gas Attack (G)

echo -exit (E)

Choice /C acge /M "Select"

if errorlevel 4 goto front.menu

if errorlevel 3 goto eng.attack.gas

if errorlevel 2 goto eng.airstrike

if errorlevel 1 goto eng.attack

::################### ATTACK MENU #######################################################################################################

:eng.attack

cls

title Blitzkrieg-Attack

color 4f

echo How would you like to attack?

echo.

echo -With a Tank (T)

echo -With a Machine Gun (M)

if %flammenwerfer%==true echo -With ze Flammenwerfer (F)

if not %flammenwerfer%==true echo.

Choice /C tmf /N /M "Select"

if errorlevel 3 goto eng.attack.flamethrower.preset

if errorlevel 2 goto eng.attack.machinegun.preset

if errorlevel 1 goto eng.attack.tank.preset

::################### TANK-ATTACK #############################################################################

:eng.attack.tank.preset

set extratnkmissilestorage=true

set tnkdmg=0

if %extratnkmissilestorage%==true set tnkmissile=10

if not %extratnkmissilestorage%==true set tnkmissile=5

set enemytnkdmg=0

set tnkattack=50

set enemytnkattack=40

set tnkdefense=20

set enemytnkdefense=19

goto eng.attack.tank

:eng.attack.tank

set enemytnkdmg=0

echo -TANK YOU VERY MUCH! (Attack with the tank) >>AchievementList.dll

cls

title Blitzkrieg-Attack with Tank

color 4f

echo _____________________________#####________________

echo __###____________________##############___________

echo __######################################__________

echo __###___________________###############___________

echo _______________################################___

echo __________##################__###################_

echo _________##################____###############_##_

echo _________##_################__###############_##__

echo _________###____#########################____##___

echo __________########______________________#####_____

echo ________________#########################_________

echo.

echo Missiles: !tnkmissile!

echo Damage: !tnkdmg! percent

echo.

echo -Shoot Missile (S) 

echo -Reload (30 Seconds) (R)

echo -Fix Tank (1 Minute) (F)

echo -exit (E)

Choice /C srfe /M "Select"

if errorlevel 4 goto front.menu

if errorlevel 3 goto eng.attack.tank.fix

if errorlevel 2 goto eng.attack.tank.reload

if errorlevel 1 goto eng.attack.tank.shoot

:eng.attack.tank.shoot

cls

if !enemytnkdmg! GEQ 100 goto eng.attack.tank

if !tnkdmg! GEQ 100 goto eng.game.over

if !tnkmissile! EQU 0 echo Out of Missiles

color 4f

set /a tnkdmg+=20

set /a enemytnkdmg+=31

set /a tnkmissile-=1

echo Your Tank has !tnkdmg! Damage points

echo The Tanks of your Enemies have got !enemytnkdmg! Damage points 

echo You have !tnkmissile! Missiles left

Choice /c yn /M "Attack again?"

if errorlevel 2 goto eng.attack.tank

if errorlevel 1 goto eng.attack.tank.shoot

:eng.attack.tank.reload

cls

title Blitzkrieg-Reloading Tank

echo Reloading... Please Wait

echo _____________________________#####________________

echo __###____________________##############___________

echo __######################################__________

echo __###___________________###############___________

echo _______________################################___

echo __________##################__###################_

echo _________##################____###############_##_

echo _________##_################__###############_##__

echo _________###____#########################____##___

echo __________########______________________#####_____

echo ________________#########################_________

if %extratnkmissilestorage%==true

(

set tnkmissile=10

)

if not %extratnkmissilestorage%==true

(

set tnkmissile=5

)

ping localhost -n 30 >nul

goto eng.attack.tank

:eng.attack.tank.fix

cls

title Blitzkrieg-Fixing Tank

echo Fixing...Please Wait

echo _____________________________#####________________

echo __###____________________##############___________

echo __######################################__________

echo __###___________________###############___________

echo _______________################################___

echo __________##################__###################_

echo _________##################____###############_##_

echo _________##_################__###############_##__

echo _________###____#########################____##___

echo __________########______________________#####_____

echo ________________#########################_________

set tnkdmg=0

ping localhost -n 60 >nul

goto eng.attack.tank

::###################### TANK-ATTACK-END ############################################################

::###################### Machine Gun Attack ###########################################################

:eng.attack.machinegun.preset

set mgbullets=1500

set mgdmg=20

goto eng.attack.machinegun

:eng.attack.machinegun

cls

title Blitzkrieg-Machine Gun Attack

echo _________ 

echo /' /!

echo / / !_

echo / / //!

echo /_________/ ////!

echo ! _ _ ! 8o////!

echo ! /'// )_ ! 8///!

echo !/ // // ) ! 8o///!

echo / // // //,! / 8//! 

echo / // // /// ! / 8//!

echo / // // ///__!/ 8//!

echo /.(_)// /// ! 8///!

echo (_)' `(_)//! ! 8////!___________

echo (_) /_\ (_)'! ! 8///////////////

echo (_) \"/ (_)'I_I 8/////////////

echo (_)._.(_) d' Hb 8oooooooopb'

echo `(_)' d' H`b

echo d' `b`b

echo d' H `b

echo d' `b `b

echo d' `b

echo d' `b

echo.

echo.

echo Bullets: %mgbullets%

echo.

echo What would you like to do?

echo.

echo Shoot like crazy (S)

echo Take a photo (P)

echo Reload (10 seconds) (R)

echo exit (E)

Choice /C spre /M "Select"

if errorlevel 4 goto front.menu

if errorlevel 3 goto eng.attack.machinegun.reload

if errorlevel 2 goto eng.attack.machinegun.takephoto

if errorlevel 1 goto eng.attack.machinegun.shoot

:eng.attack.machinegun.shoot

set magazin=5

cls

echo You have !mgbullets! Bullets

echo Pres Enter to start shooting

pause >nul

start /min Kill.vbs

start /min shoot.vbs

:eng.attack.machinegun.shoot.mouse.setup

cls

Batbox /g 20 10 /c 0x4f /d "TARGET"

Batbox /g 0 0 /c 0x0f /d "Bullets: !mgbullets!"

Batbox /g 0 1 /c 0x0f /d "Magazines: %magazin%"

Batbox /g 0 2 /c 0x0f /d "Go back to the menu"

::########xx#yy##hexcol####"text"

for /f "delims=: tokens=1,2" %%A in ('Batbox /m') do (

set x=%%A

set y=%%B

	

)

if %y%==2 (

IF %x% GEQ 0 IF %x% LEQ 19 (

goto front.menu

start /min SchoolShooter.vbs

start /min sound.vbs

)

)

if %y%==10 (

REM first char is at x=20 total chars=5___20+5=25

IF %x% GEQ 20 IF %x% LEQ 25 (

goto click

)

)

:Click

set /a mgbullets-=10

IF !mgbullets! EQU 0 set /a magazin-=1 & set mgbullets=1500

IF %magazin% EQU 0 batbox /g 0 2 /c 0x0f /d "You haven't got any Bullets left!" & set mgbullets=0 & set magazin=0 & batbox /g 20 10 /c 0x9c /d "MISSED" /w 100 & pause >nul & goto backtomenu

IF NOT !mgbullets! EQU 0 batbox /g 20 10 /c 0x4f /d "DEAD " /w 100

IF NOT %magazin% EQU 0 batbox /g 20 10 /c 0x4f /d "DEAD " /w 100

goto eng.attack.machinegun.shoot.mouse.setup

:backtomenu

goto front.menu

start /min SchoolShooter.vbs

start /min sound.vbs

:eng.attack.machinegun.takephoto

cls

echo You got shot!

pause >nul

goto eng.game.over

:eng.attack.machinegun.reload

cls

echo You have %magazin% Bullet Packs

echo You have !mgbullets! Bullets

Choice /C ra /N /M "(R)eload or (a)bort?"

if errorlevel 2 goto front.menu

if errorlevel 1 goto eng.attack.machinegun.reload.yes

:eng.attack.machinegun.reload.yes

cls

echo Reloading, please be patient...

set magazin=5

set mgbullets=1500

ping localhost -n 10 >nul

goto eng.attack.machinegun

:eng.airstrike

cls

title Airstrike

echo Input your Coordinates (in 2 lines Latitude then Longitude)

call Position.txt

(

set /p lat=

set /p long=

)<Position.txt

echo Calling Airstrike to %lat% %long%

pause

goto front.menu

:eng.attack.gas

cls

::check if gas is not 0

if %gas% EQU 0 echo You don't have any Gas. get some from the supply room. & pause & goto front.menu

if %gas% NEQ 0 goto eng.attack.gas.fire

:eng.attack.gas.fire

cls

title Gas Attack

echo Current gas: %currgss%

echo.

echo.

echo.

echo A) ATTACK!

echo B) Change Gas

choice /C ab /M "Enter" 

if errorlevel 2 goto eng.attack.gas.select

if errorlevel 1 goto eng.attack.gas.attack

:eng.attack.gas.select

set currgss=none

cls

echo Current gas: %currgss%

echo.

echo Choose new:

echo.

if %zyklonb%==true echo Zyklon (B)

if not %zyklonb%==true echo.

echo Type Gasname without spaces!

echo -Mustard Gas

echo -Chlorine Gas

echo -Tear Gas

echo -Cyanide

echo -Carbon Monoxide

echo -Cyanogen Chloride

echo -Tabun (Nerve gas)

echo -Sarin (extremely deadly nerve gas)

echo -b to go back

set /p gss=Enter: 

if %newgas%==ZyklonB (

set currgss=Zyklon B

goto eng.attack.gas.fire) 

if %newgas%==MustardGas (

set currgss=Mustard Gas

goto eng.attack.gas.fire)

if %newgas%==ChlorineGas (

set currgss=Chlorine Gas

goto eng.attack.gas.fire)

if %newgas%==TearGas (

set currgss=Tear Gas

goto eng.attack.gas.fire)

if %newgas%==Cyanide (

set currgss=Cyanide

goto eng.attack.gas.fire)

if %newgas%==CarbonMonoxide (

set currgss=Carbon Monoxide

goto eng.attack.gas.fire)

if %newgas%==CyanogenChloride (

set currgss=Cyanogen Chloride

goto eng.attack.gas.fire)

if %newgas%==Tabun (

set currgss=Tabun

goto eng.attack.gas.fire)

if %newgas%==Sarin (

set currgss=Sarin

goto eng.attack.gas.fire)

if %newgas%==b goto eng.attack.gas.fire

goto eng.attack.gas.select

:eng.attack.gas.attack

start /min Kill.vbs

cls

echo ATTACK

call ABC-Alarm.mp3

call Gasattack.mp4

Pause

::##################### INVENTAR-Englisch ###################################################################################################################

:front.eng.inventory

set specialcharclass=None

cls

title Blitzkrieg-Inventory

echo Weapons:

if %flammenwerfer%==true echo Flamethrower

if not %flammenwerfer%==true echo.

if %specialcharclass%==Healer echo Medical Equipment

if %specialcharclass%==Sniper echo Sniper Rifle

if %specialcharclass%==None echo Machine Gun 

echo.

echo.

echo Miscellanous:

echo Wehrmachtsuniform

pause

::##################### INVENTAR-Englisch Ende ##############################################################################################################

::##################### YEAR-ENGLISCH #######################################################################################################################

:front.eng.year

cls

echo The year is %year%

pause

goto front.menu

::##################### YEAR-ENGLISCH #######################################################################################################################

::##################### Invade eng ###########################################################################################################################

:front.eng.invade

cls

if %year% GEQ 1940 echo You can't invade any country anymore & timeout 3 >nul & goto front.menu

echo Invaded Countries: %invadedcount%

echo Countries left: %leftcount%

echo.

echo.

echo Which country would you like to invade?

echo.

echo 1) Poland 2) Soviet Union

echo 3) Finland 4) Sweden

echo 5) Norway 6) Switzerland

echo 7) France 8) Spain

set /p xcy=

if "%xcy%" == "1" goto front.eng.invade.poland

if "%xcy%" == "2" goto front.eng.invade.ussr

if "%xcy%" == "3" goto front.eng.invade.finland

if "%xcy%" == "4" goto front.eng.invade.sweden

if "%xcy%" == "5" goto front.eng.invade.norway

if "%xcy%" == "6" goto front.eng.invade.switzerland

if "%xcy%" == "7" goto front.eng.invade.france

if "%xcy%" == "8" goto front.eng.invade.spain

:front.eng.invade.poland

cls

echo Invading Poland

pause

goto front.eng.invade

:front.eng.invade.ussr

cls

echo Invading the Union of Socialist Soviet Republics

call USSR-Anthem.mp3

pause

goto front.eng.invade

:front.eng.invade.finland

cls 

echo Invading Finland

call FINLAND.mp4

pause

goto front.eng.invade

:front.eng.invade.sweden

cls

echo Invading Sweden

call Sweden.mp4

pause

goto front.eng.invade

:front.eng.invade.norway

cls

echo Invading Norway

call norway.mp4

pause

goto front.eng.invade

:front.eng.invade.switzerland

cls

echo Invading Switzerland

call switzerland.mp4

pause

goto front.eng.invade

:front.eng.invade.france

cls

echo Invading France

call france.mp4

pause

goto front.eng.invade

:front.eng.invade.spain

cls

echo Invading Spain

call spain.mp4

pause

goto front.eng.invade

:front.eng.switch

cls

title Switch Front

echo Current Front: %frontrn%

echo.

echo.

echo Select new front:

echo.

echo 1) USSR front

echo 2) French front

echo 3) Italian front

echo 4) idk

echo.

set /P switch=

if %switch%==1 set frontrn=USSR

if %switch%==2 set frontrn=France

if %switch%==3 set frontrn=Italian

:front.eng.suicide

cls

goto eng.game.over

:front.eng.invadedmap

cls

title Invaded Countries

echo Soon :)

timeout 3 >nul

goto front.menu

:front.eng.defeated

cls

title Defeated Countries

echo Soon :)

timeout 3 >nul

goto front.menu 

:front.eng.meet.ss

if not %rank%==unteroffizier (

echo You are not trustworthy... 

pause 

goto front.menu

)

title SS Meeting

echo What do you want to discuss ?

echo.

echo 1) War Plans

echo 2) Secret Hitler Assassination Plan

:front.eng.meet.wehrmacht

cls

:front.eng.meet.hitler

cls

if not %rank%==offizier (

echo You are not trustworthy... 

pause 

goto front.menu

)

:front.eng.supply

cls

title Supply Room

echo Your Inventory: Pistolammo: %ammo% Gas: %gas% MGBullets: %mgbullets% Magazines: %magazin%

echo -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo Things in the supply room: 

echo -Pistolammo (%pacount%)

echo -Gas (%gcount%)

echo -MGBullets (%mgbcount%)

echo -Magazines (%magacount%)

:eng.game.over

cls

echo #### ## # # ###### #### # # ###### ##### 

echo # # # # ## ## # # # # # # # # 

echo # # # # ## # ##### # # # # ##### # # 

echo # ### ###### # # # # # # # # ##### 

echo # # # # # # # # # # # # # # 

echo #### # # # # ###### #### ## ###### # # 

echo.

echo.

echo.

echo # # ###### 

echo # # #### # # # # # ###### ##### 

echo # # # # # # # # # # # # 

echo # # # # # # # # ##### # # 

echo # # # # # # # # # # # 

echo # # # # # # # # # # # 

echo # #### #### ###### # ###### ##### 

echo.

echo.

echo.

Choice /C yn /N /M "Do you want to restart (y/n)?" 

if errorlevel 2 exit

if errorlevel 1 goto MainMenu 

