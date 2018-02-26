(defconstant +patterns+ '(
      (101 . "
       ....**......**.... 
       ...*.*......*.*...
       ...*..........*...
       **.*..........*.**
       **.*.*..**..*.*.**
       ...*.*.*..*.*.*...
       ...*.*.*..*.*.*...
       **.*.*..**..*.*.**
       **.*..........*.**
       ...*..........*...
       ...*.*......*.*...
       ....**......**....")
      
      (A-for-All . "
       ....**....
       ...*..*...
       ...****...
       .*.*..*.*.
       *........*
       *........*
       .*.*..*.*.
       ...****...
       ...*..*...
       ....**....")
      
      (acorn . "
       .*.....
       ...*...
       **..***")
      
      (aircraft-carrier . "
       **..
       *..*
       ..**")
      
      (airforce . "
       .......*......
       ......*.*.....
       .......*......
       ..............
       .....*****....
       ....*.....*.**
       ...*.**...*.**
       ...*.*..*.*...
       **.*...**.*...
       **.*.....*....
       ....*****.....
       ..............
       ......*.......
       .....*.*......
       ......*.......")
      
      (ants . "
       **........**...**...**...**...**...**..
       ..**.**.....**...**...**...**...**...**
       ..**...**...**...**...**...**...**...**
       **.....**.**...**...**...**...**...**..
       .....**................................")
      
      (aVerage . "
       .....*.....
       ....*.*....
       .....*.....
       ...........
       ...*****...
       ..*..*..*..
       .*.**.**.*.
       .*.*...*.*.
       **.*...*.**
       *..*.*.*..*
       ..*.....*..
       ...*****...
       .....*.....")
      
      (b-heptomino . "
       .*..
       ***.
       *.**")
      
      (b-heptomino-shuttle . "
       .................*...........
       **...............**........**
       **................**.......**
       .................**..........
       .............................
       .............................
       .............................
       .................**..........
       ..................**.........
       .................**..........
       .................*...........")
      
      (bakery . "
       ....**....
       ...*..*...
       ...*.*....
       .**.*...*.
       *..*...*.*
       *.*...*..*
       .*...*.**.
       ....*.*...
       ...*..*...
       ....**....")
      
      (barberpole . "
       .....**
       ......*
       ...*.*.
       .......
       .*.*...
       *......
       **.....")
      
      (barge . "
       .*..
       *.*.
       .*.*
       ..*.")
      
      (beacon . "
       **..
       *...
       ...*
       ..**")
      
      (beehive . "
       .**.
       *..*
       .**.")
      
      (beehive-and-dock . "
       **..**
       *....*
       .****.
       ......
       ...**.
       ..*..*
       ...**.")
      
      (beehive-with-tail . "
       .*...
       *.*..
       *.*..
       .*...
       ..***
       ....*")
      
      (bi-loaf . "
       .*.....
       *.*....
       *..*...
       .**.*..
       ...*.*.
       ...*..*
       ....**.")
      
      (biblock . "
       **.**
       **.**")
      
      (big-S . "
       ....**.
       ...*..*
       ...*.**
       **.*...
       *..*...
       .**....")
      
      (bipole . "
       **...
       *.*..
       .....
       ..*.*
       ...**")
      
      (blinker . "
       ...
       ***
       ...")
      
      (blinker-ship . "
       ...........*..*...............
       ..........*...................
       ..........*...*...............
       ..**......****................
       .****.........................
       **.**.........................
       .**.....**.***................
       .......*.....**.......*....***
       ......**.......*......*....*.*
       .......*.....**.......*....***
       .**.....**.***................
       **.**.........................
       .****.........................
       ..**......****................
       ..........*...*...............
       ..........*...................
       ...........*..*...............")
      
      (block . "
       **
       **")
      
      (block-and-dock . "
       **..**
       *....*
       .****.
       ......
       ...**.
       ...**.")
      
      (block-on-table . "
       **...
       .*...
       .*.**
       **.**")
      
      (blocker . "
       .......*.*
       ......*...
       **..*....*
       **.*..*.**
       .....**...")
      
      (boat . "
       .*.
       *.*
       .**")
      
      (boat-on-boat . "
       .*....
       *.*...
       .**...
       ...**.
       ...*.*
       ....*.")
      
      (bookends . "
       **...**
       *.*.*.*
       ..*.*..
       .**.**.")
      
      (boss . "
       .....*.....
       ....*.*....
       ....*.*....
       ...**.**...
       ..*.....*..
       .*.*.*.*.*.
       .*.*...*.*.
       **.*...*.**
       *..*.*.*..*
       ..*.....*..
       ...**.**...
       ....*.*....
       ....*.*....
       .....*.....")
      
      (brain . "
       .**........
       *..*.....**
       ***...***..
       *..*.****..
       .***...*...
       .*..***....
       ...*....**.
       ...*****.*.
       ...........
       ...*****.*.
       ...*....**.
       .*..***....
       .***...*...
       *..*.****..
       ***...***..
       *..*.....**
       .**........")
      
      (bunnies . "
       *.....*.
       ..*...*.
       ..*..*.*
       .*.*....")
      
      (burloaferimeter . "
       .....*.....
       ....*.*....
       ...*.*.*...
       ...*.*.*...
       **.*.*.*.**
       **.*....*.*
       ....****...
       ...........
       ....**.....
       ....**.....")
      
      (caterer . "
       .....*..
       ****...*
       ...*...*
       .......*
       ....*...
       .....**.")
      
      (centinal . "
       **................................................**
       .*................................................*.
       .*.*.....................**.....................*.*.
       ..**........*............**............**.......**..
       ...........**..........................*.*..........
       ..........**.............................*..........
       ...........**..**......................***..........
       ....................................................
       ....................................................
       ....................................................
       ...........**..**......................***..........
       ..........**.............................*..........
       ...........**..........................*.*..........
       ..**........*............**............**.......**..
       .*.*.....................**.....................*.*.
       .*................................................*.
       **................................................**")
      
      (chemist . "
       .......*.......
       .......***.....
       ..........*....
       .....***..*..**
       ....*.*.*.*.*.*
       ....*...*.*.*..
       .**.*.*.*.*.**.
       ..*.*.*...*....
       *.*.*.*.*.*....
       **..*..***.....
       ....*..........
       .....***.......
       .......*.......")
      
      (cis-mirrored-R-bee . "
       .**.
       *..*
       ***.
       ....
       ***.
       *..*
       .**.")
      
      (cis-boat-with-tail . "
       ....*
       ..***
       .*...
       *.*..
       .**..")
      
      (clock . "
       ..*.
       **..
       ..**
       .*..")
      
      (cloverleaf . "
       ...*.*...
       .***.***.
       *...*...*
       *.*.*.*.*
       .*******.
       .........
       .*******.
       *.*.*.*.*
       *...*...*
       .***.***.
       ...*.*...")
      
      (confused-eaters . "
       *..........
       ***........
       ...*.......
       ..*........
       ..*..*.....
       .....*.....
       ...*.*.....
       ...**..**..
       .......*.*.
       .........*.
       .........**")
      
      (cross . "
       ..****..
       ..*..*..
       ***..***
       *......*
       *......*
       ***..***
       ..*..*..
       ..****..")
      
      (dart . "
       ........*.
       .......*.*
       ......**..
       .........*
       .....*...*
       ..*..*....
       .*.*..****
       *..*......
       .*.*..****
       ..*..*....
       .....*...*
       .........*
       ......**..
       .......*.*
       ........*.")
      
      (dead-spark-coil . "
       **...**
       *.*.*.*
       ..*.*..
       *.*.*.*
       **...**")
      
      (diamond-ring . "
       ......*......
       .....*.*.....
       ....*.*.*....
       ....*...*....
       ..**..*..**..
       .*....*....*.
       *.*.**.**.*.*
       .*....*....*.
       ..**..*..**..
       ....*...*....
       ....*.*.*....
       .....*.*.....
       ......*......")
      
      (double-wing . "
       **.....**
       *.......*
       .***.***.
       ...*.*...
       ....*....")
      
      (eater . "
       **..
       *.*.
       ..*.
       ..**")
      
      (elevener . "
       ....**
       .....*
       ..***.
       ..*...
       *.*...
       **....")
      
      (figure-8 . "
       ***...
       ***...
       ***...
       ...***
       ...***
       ...***")
      
      (fleet . "
       ....**....
       ....*.*...
       .....**...
       .......**.
       **.....*.*
       *.*.....**
       .**.......
       ...**.....
       ...*.*....
       ....**....")
      
      (fourteener . "
       ....**.
       **..*.*
       *.....*
       .*****.
       ...*...")
      
      (fumarole . "
       ...**...
       .*....*.
       .*....*.
       .*....*.
       ..*..*..
       *.*..*.*
       **....**")
      
      (glider . "
       ..*
       *.*
       .**")
      
      (Gosper-gun . "
       .........................*..........
       ......................****....*.....
       .............*.......****.....*.....
       ............*.*......*..*.........**
       ...........*...**....****.........**
       **.........*...**.....****..........
       **.........*...**........*..........
       ............*.*.....................
       .............*......................")
      
      (gourmet . "
       ..........**........
       ..........*.........
       ..*.**.**.*.....**..
       ..**.*.*.*......*...
       ........*........*..
       ................**..
       ....................
       ...........*....**..
       *.........*.*..*.*..
       ***......**.**..*...
       ...*.............***
       ..*.*..............*
       ..**................
       ....................
       ..**................
       ..*........*........
       ...*......*.*.*.**..
       ..**.....*.**.**.*..
       .........*..........
       ........**..........")
      
      (gray-counter . "
       ....*....
       ...*.*...
       ....*....
       .........
       ..*****..
       .*.....*.
       *.*...*.*
       .*.....*.
       ..*****..
       .........
       ....*....
       ...*.*...
       ....*....")
      
      (great-on-off . "
       ..**....
       .*..*...
       .*.**...
       **.*.**.
       ....**.*
       .......*
       ....***.
       ....*...")
      
      (hat . "
       ..*..
       .*.*.
       .*.*.
       **.**")
      
      (heavyweight-emulator . "
       .......**.......
       ..**.*....*.**..
       ..*..........*..
       ...**......**...
       ***..******..***
       *..*........*..*
       .**..........**.")
      
      (heavyweight-spaceship . "
       .******
       *.....*
       ......*
       *....*.
       ..**...")
      
      (heavyweight-volcano . "
       .........*..........................
       ........*.*.........................
       ......***.*.........................
       .....*....**.*......................
       .....*.**...**......**..............
       ....**.*.**.........*.*.............
       .........*.*****......*..*.**.......
       ..*.**.**.*.....*....**.*.**.*......
       .....**.....****........*....*......
       *...*.*..*...*.*....**.*.****.**....
       *...*.*..**.*.**.**....*.*....*.*...
       .....**...***.**.*.***.*..***...*...
       ..*.**.**.**.............*.*..*.*.**
       ...........*......*.*.*.*..**.*.*.*.
       ....**.*.*.**......**.*.*.*...*.*.*.
       .....*.**.*..*.......*.**..****.**..
       .....*....*.*........*...**.........
       ....**....**........**...*..*.......
       ...........................**.......")
      
      (Hertz-oscillator . "
       ...**.*....
       ...*.**....
       ...........
       ....***....
       ...*.*.*.**
       ...*...*.**
       **.*...*...
       **.*...*...
       ....***....
       ...........
       ....**.*...
       ....*.**...")
      
      (honeyfarm . "
       ......*......
       .....*.*.....
       .....*.*.....
       ......*......
       .............
       .**.......**.
       *..*.....*..*
       .**.......**.
       .............
       ......*......
       .....*.*.....
       .....*.*.....
       ......*......")
      
      (hustler . "
       .....**....
       .....**....
       ...........
       ...****....
       *.*....*...
       **.*...*...
       ...*...*.**
       ...*....*.*
       ....****...
       ...........
       ....**.....
       ....**.....")
      
      (induction-coil . "
       .**....
       .*..*..
       ..***..
       .......
       *******
       *..*..*")
      
      (integral-sign . "
       ...**
       ..*.*
       ..*..
       *.*..
       **...")
      
      (jam . "
       ....**.
       ...*..*
       .*..*.*
       *....*.
       *......
       ..***..")
      
      (keys . "
       .*........*.
       *.***..***.*
       .*..*..*..*.
       ....*..*....")
      
      (kickback-reaction . "
       ....*.*
       ***..**
       ..*..*.
       .*.....")
      
      (Koks-galaxy . "
       ******.**
       ******.**
       .......**
       **.....**
       **.....**
       **.....**
       **.......
       **.******
       **.******")
      
      (light-bulb . "
       .**.*..
       .*.**..
       .......
       ..***..
       .*...*.
       .*...*.
       ..*.*..
       *.*.*.*
       **...**")
      
      (lightspeed-wire . "
       ...*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*...
       ...**********************************************************...
       ................................................................
       .**************************************************************.
       *.................................*.......*..........*.........*
       ****.**.*..*****..***************....*****....*******...********
       ....*...**.....**.......*.......*........*............*.........
       ******..*..*****..*****....******....*****....*******...********
       *......................*.........*........*..........*.........*
       .**************************************************************.
       ................................................................
       ...**********************************************************...
       ...*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*...")
      
      (lightweight-emulator . "
       ..**.*..*.**..
       ..*........*..
       ...**....**...
       ***..****..***
       *..*......*..*
       .**........**.")
      
      (lightweight-spaceship . "
       .****
       *...*
       ....*
       *..*.")
      
      (loaf . "
       .*..
       *.*.
       *..*
       .**.")
      
      (long-barge . "
       .*...
       *.*..
       .*.*.
       ..*.*
       ...*.")
      
      (long-boat . "
       .*..
       *.*.
       .*.*
       ..**")
      
      (long-ship . "
       **..
       *.*.
       .*.*
       ..**")
      
      (loop . "
       *...
       ***.
       ...*
       **.*
       *.*.")
      
      (lumps-of-muck . "
       **.....................
       **.....................
       .......................
       .......................
       .**.................**.
       .**.................**.
       .......................
       .......................
       .....................**
       .....................**")
      
      (mango . "
       .**..
       *..*.
       .*..*
       ..**.")
      
      (mazing . "
       ...**..
       .*.*...
       *.....*
       .*...**
       .......
       ...*.*.
       ....*..")
      
      (middleweight-emulator . "
       .......*.......
       ..**.*...*.**..
       ..*.........*..
       ...**.....**...
       ***..*****..***
       *..*.......*..*
       .**.........**.")
      
      (middleweight-spaceship . "
       .*****
       *....*
       .....*
       *...*.
       ..*...")
      
      (middleweight-volcano . "
       ...*******...
       .***.***.***.
       *....***....*
       .****.*.***.*
       ...........*.
       *.**.*.*.*...
       **.*.*.*.**..
       ....*..*.*...
       .....**..*...
       .........**..")
      
      (MIT-oscillator . "
       ....**...
       ...*.*...
       ...*.....
       **.*.....
       **.*..*..
       ....**.*.
       .......*.
       .......**")
      
      (mold . "
       .**...
       *..*..
       *.*..*
       .*....
       ..**.*
       ....*.")
      
      (monogram . "
       **...**
       .*.*.*.
       .**.**.
       .*.*.*.
       **...**")
      
      (negentropy . "
       ......**....
       ......**....
       ............
       ....****..**
       **.*..*.*..*
       .*.*...**.*.
       *..*....*.**
       **..****....
       ............
       ....**......
       ....**......")
      
      (octagon-II . "
       ...**...
       ..*..*..
       .*....*.
       *......*
       *......*
       .*....*.
       ..*..*..
       ...**...")
      
      (Orion . "
       ...**.........
       ...*.*........
       ...*..........
       **.*..........
       *....*........
       *.**......***.
       .....***....**
       ......***.*.*.
       .............*
       ......*.*.....
       .....**.*.....
       ......*.......
       ....**.*......
       .......*......
       .....**.......")
      
      (paperclip . "
       ..**.
       .*..*
       .*.**
       **.*.
       *..*.
       .**..")
      
      (pedestle . "
       .....*.....
       ....*.*....
       .*..**.....
       .***.......
       .....***...
       ...**...*..
       ..*....*..*
       .*.*.*.*.**
       .*.*...*.*.
       **.*.*.*.*.
       *..*....*..
       ..*...**...
       ...***.....
       .......***.
       .....**..*.
       ....*.*....
       .....*.....")
      
      (penny-lane . "
       ...**.....**...
       ...*.......*...
       **.*.......*.**
       **.*.*****.*.**
       ....*..*..*....
       .....*****.....
       ...............
       .......*.......
       ......*.*......
       .......*.......")
      
      (pentadecathlon . "
       ..*....*..
       **.****.**
       ..*....*..")
      
      (phoenix . "
       ...*....
       ...*.*..
       .*......
       ......**
       **......
       ......*.
       ..*.*...
       ....*...")
      
      (pi-heptomino . "
       ***
       *.*
       *.*")
      
      (pond . "
       .**.
       *..*
       *..*
       .**.")
      
      (pond-on-pond . "
       .**....
       *..*...
       *..*...
       .**.**.
       ...*..*
       ...*..*
       ....**.")
      
      (pressure-cooker . "
       .....*.....
       ....*.*....
       ....*.*....
       ...**.**...
       *.*.....*.*
       **.*.*.*.**
       ...*...*...
       ...*...*...
       ....***....
       ...........
       ...*.**....
       ...**.*....")
      
      (pseudo-barberpole . "
       ..........**
       ...........*
       .........*..
       .......*.*..
       ............
       .....*.*....
       ............
       ...*.*......
       ............
       ..**........
       *...........
       **..........")
      
      (pulsar . "
       ..***...***..
       .............
       *....*.*....*
       *....*.*....*
       *....*.*....*
       ..***...***..
       .............
       ..***...***..
       *....*.*....*
       *....*.*....*
       *....*.*....*
       .............
       ..***...***..")
      
      (pushalong . "
       ..***.*.....
       .****.*.....
       **..........
       .*.*........
       ..****.*....
       ...***......
       ............
       ............
       ......*****.
       ......*....*
       ......*.....
       .......*...*
       .........*..")
      
      (pyrotechneczum . "
       .......*........
       .....*****......
       ....*.....*.....
       .*..*..***.*....
       *.*.*.*....*..*.
       .*..*....*.*.*.*
       ....*.***..*..*.
       .....*.....*....
       ......*****.....
       ........*.......")
      
      (quad . "
       **..**
       *..*.*
       .*....
       ....*.
       *.*..*
       **..**")
      
      (quapole . "
       **.....
       *.*....
       .......
       ..*.*..
       .......
       ....*.*
       .....**")
      
      (queen-bee . "
       *....
       ****.
       .****
       .*..*
       .****
       ****.
       *....")
      
      (queen-bee-shuttle . "
       ..........*...........
       ..........****........
       **.........****.....**
       **.........*..*.....**
       ...........****.......
       ..........****........
       ..........*...........")
      
      (r-pentomino . "
       .**
       **.
       .*.")
      
      (R2D2 . "
       ...**...
       ...**...
       ........
       .******.
       *......*
       ***...**
       ........
       ********
       *......*
       ...**...
       ...**...")
      
      (rabbits . "
       *...***
       ***..*.
       .*.....")
      
      (rephaser . "
       ...**...
       ...**...
       ........
       ........
       .**..**.
       *.*..*.*
       ..*..*..")
      
      (revolver . "
       **....**
       .*....*.
       .*.**.*.
       ..*..*..
       ...*....
       .....*..
       .**.....
       .....**.
       ..*.....
       ....*...
       ..*..*..
       .*.**.*.
       .*....*.
       **....**")
      
      (roteightor . "
       .*............
       .***........**
       ....*.......*.
       ...**.....*.*.
       ..........**..
       ..............
       .....***......
       .....*..*.....
       .....*........
       ..**..*...*...
       .*.*......*...
       .*.......*....
       **........***.
       ............*.")
      
      (Schick-engine . "
       .....****
       ....*...*
       ........*
       **..*..*.
       ***......
       **..*..*.
       ........*
       ....*...*
       .....****")
      
      (scorpion . "
       ...*...
       .***...
       *...**.
       *.*.*.*
       .**.*.*
       .....*.")
      
      (scrubber . "
       ....*......
       ..***......
       .*.........
       .*..***....
       **.*...*...
       ...*...*...
       ...*...*.**
       ....***..*.
       .........*.
       ......***..
       ......*....")
      
      (shillelagh . "
       **...
       *..**
       .**.*")
      
      (ship . "
       **.
       *.*
       .**")
      
      (ship-on-boat . "
       **....
       *.*...
       .**...
       ...**.
       ...*.*
       ....*.")
      
      (shiptie . "
       **....
       *.*...
       .**...
       ...**.
       ...*.*
       ....**")
      
      (siesta . "
       ...........**...
       ...**.....*.*...
       ...*.*....*.....
       .....*...**.*...
       ...*.**.....***.
       .***.....*.*...*
       *...*.*.....***.
       .***.....**.*...
       ...*.**...*.....
       .....*....*.*...
       ...*.*.....**...
       ...**...........")
      
      (sinking-ship . "
       ...**
       ....*
       ...*.
       *.*..
       **...")
      
      (skewed-quad . "
       .**....
       .*...**
       ..*.*.*
       .......
       *.*.*..
       **...*.
       ....**.")
      
      (smiley . "
       **.*.**
       ...*...
       *.....*
       .*****.
       .......
       .......
       ***.***")
      
      (snacker . "
       **................**
       .*................*.
       .*.*............*.*.
       ..**............**..
       .......*....*.......
       .....**.****.**.....
       .......*....*.......
       ..**............**..
       .*.*............*.*.
       .*................*.
       **................**")
      
      (snake . "
       *.** 
       **.*")
      
      (snake-pita . "
       *.**.** 
       **.*.*.
       ......*
       ***.***
       *......
       .*.*.**
       **.**.*")
      
      (sombreros . "
       ...**........**...
       ...*.*......*.*...
       .....*......*.....
       ...*.**....**.*...
       .***..........***.
       *...*.*....*.*...*
       .***..........***.
       ...*.**....**.*...
       .....*......*.....
       ...*.*......*.*...
       ...**........**...")
      
      (spark-coil . "
       **....**
       *.*..*.*
       ..*..*..
       *.*..*.*
       **....**")
      
      (sparky . "
       ..........*....................
       ..........*...............**...
       ......**.*.***..........**...*.
       *.**.**.**..*.*...**.****......
       *...**..*.**..***..*.**..**...*
       *.**....***.*.***......**..*...
       ........**.*...............*..*
       *.**....***.*.***......**..*...
       *...**..*.**..***..*.**..**...*
       *.**.**.**..*.*...**.****......
       ......**.*.***..........**...*.
       ..........*...............**...
       ..........*....................")
      
      (spiral . "
       **....*
       .*..***
       .*.*...
       ..*.*..
       ...*.*.
       ***..*.
       *....**")
      
      (star . "
       .....*.....
       ....***....
       ..***.***..
       ..*.....*..
       .**.....**.
       **.......**
       .**.....**.
       ..*.....*..
       ..***.***..
       ....***....
       .....*.....")
      
      (switch-engine . "
       .*.*..
       *.....
       .*..*.
       ...***")
      
      (table-on-table . "
       *..*
       ****
       ....
       ****
       *..*")
      
      (technician-finished-product . "
       .....*.....
       ....*.*....
       ....**.....
       ..**.......
       .*...***...
       *..**...*.*
       .**....*.**
       ...*.*.*...
       ...*...*...
       ....***....
       ......*.*..
       .......**..")
      
      (test-tube-baby . "
       **....**
       *.*..*.*
       ..*..*..
       ..*..*..
       ...**...")
      
      (toad . "
       .***
       ***.")
      
      (toadsucker . "
       ...*....*..
       .**.****.**
       ...*....*..
       ...........
       ...........
       ...........
       ...........
       ...........
       .....***...
       ....***....
       ...........
       ...........
       ...........
       ...........
       ...........
       ..*....*...
       **.****.**.
       ..*....*...")
      
      (toaster . "
       ...**..**... 
       .***.**.***.
       *..........*
       .****..****.
       ....*..*....
       .**......**.
       .*..*..*..*.
       ..***..***..
       ............
       ****.**.****
       *..**..**..*")
      
      (traffic-circle . "
       .....................**....**................... 
       .....................*.*..*.*...................
       .......................*..*.....................
       ......................*....*....................
       ......................*....*....................
       ......................*....*....................
       ........................**.....**...............
       ...............................***..............
       ...............................**.*.............
       .................................*.*............
       .........................***....*..*............
       .................................**.............
       .........**............*.....*..................
       ........*..*...........*.....*..................
       ......*..*.*...........*.....*..................
       ..........*.....................................
       ......*.**...............***....................
       .......*.....*..................................
       .............*..................................
       **...........*..................................
       *..***..........................................
       .**......***...***............................**
       ......*...................................***..*
       ......*......*...............................**.
       .**..........*........*..................*......
       *..***.......*......**.**............*...*......
       **....................*............**.**.....**.
       .....................................*....***..*
       ..............................................**
       ................................................
       ......................................*.*.......
       ....................***..................*......
       .....................................*..*.......
       ..................*.....*...........*.*.*.......
       ..................*.....*...........*..*........
       ..................*.....*............**.........
       .............**.................................
       ............*..*....***.........................
       ............*.*.*...............................
       .............*.***..............................
       ...............***..............................
       ......................**........................
       ....................*....*......................
       ....................*....*......................
       ....................*....*......................
       .....................*..*.......................
       ...................*.*..*.*.....................
       ...................**....**.....................")
      
      (traffic-lights . "
       ....*....
       ....*....
       ....*....
       .........
       ***...***
       .........
       ....*....
       ....*....
       ....*....")
      
      (trans-boat-with-tail . "
       ...**
       ..*.*
       .*.*.
       .*...
       **...")
      
      (trice-tongs . "
       **.....
       **..*..
       ..**.*.
       ..*..*
       .*...**
       ..***..
       ....*..")
      
      (tripole . "
       **....
       *.*...
       ......
       ..*.*.
       .....*
       ....*a")
      
      (tub . "
       .*. 
       *.*
       .*.")
      
      (tub-with-tail . "
       .*... 
       *.*..
       .*.*.
       ...*.
       ...**")
      
      (tubber ."
       ....*.*...... 
       ....**.*.....
       .......***...
       ....**....*..
       **.*..**..*..
       .*.*....*.**.
       *...*...*...*
       .**.*....*.*.
       ..*..**..*.**
       ..*....**....
       ...***.......
       .....*.**....
       ......*.*....")
      
      (tumbler . "
       .**.**. 
       .**.**.
       ..*.*..
       *.*.*.*
       *.*.*.*
       **...**")
      
      (turtle . "
       .***.......*.. 
       .**..*.**.**..
       ...***....*...
       .*..*.*...*...
       *....*....*..*
       *....*....*..*
       .*..*.*...*...
       ...***....*...
       .**..*.**.**..
       .***.......*..")
      
      (twinhat . "
       ..*...*..
       .*.*.*.*.
       .*.*.*.*.
       **.*.*.**
       ....*....")
      
      (two-eaters . "
       **.......
       .*.......
       .*.*.....
       ..**.....
       .....**..
       .....*.*.
       .......*.
       .......**")
      
      (unix . "
       .**..... 
       .**.....
       ........
       .*......
       *.*.....
       *..*..**
       ....*.**
       ..**....")
      
      (very-long-barge . " 
       .*....
       *.*...
       .*.*..
       ..*.*.
       ...*.*
       ....*.")
      
      (very-long-boat . "
       .*... 
       *.*..
       .*.*.
       ..*.*
       ...**")
      
      (very-long-ship . "
       **... 
       *.*..
       .*.*.
       ..*.*
       ...**")
      ))
