	 

 �
 <  
 M ����	 

  �����  7  � M �����  9 
  M U���        {.�  
�C?          �?  ��L�    �@        ����  9 
 M ������L���L?   ff@  �����        �    �?  ��L>    �?        ���� 9 
 9 
 M F����G!����� �  9 
 M ����    ��  ��L�  
�#?�       ��    �?  ��L�    �@        ���� 9 
 9 
 M y������>��? �     33s�  )\�?�     ���=  �(\?�  9 
 M ����    ���        A    �?�       ��    �@�       p�  ���� 9 
 9 
 M ������y���ٿ �     F��  ���?  fff>�  9 
 M ���    ���       �@�        �  ffF?  
�#<    �@�       p�  ������33� �       �?  �Se@�   �  1      M Q���  9��>  �v~? =���  ����  �v~?�  9 
 	M !���    ���       �@�       �?�       ��    �@�       p�  ����  7  �M ����  ��  �? �     ff�?�  1      M u���    ��  ff.A    ���        �    @?  33�>     @        ����

  
       ��>�       �A[          	 @?  BONNETBTTF3 � 7  � 9   M ����7  	      �? n���7  	      �? 
�  %  
 M �����
 � �  9� M �����       �A  ��>P ����  �z�=P �����  !� 
�#<M ��� 
 33@ n����  �  M �����       �A�  
 �  
 � 	 
 i   i   i 	  �   i  
 i  
 [   [   [   [ 	      �@      4C �  �    ��L����=���> i   ���=��L> i     ���=  ���=[   [   [  	             	   	 c   c   c  	  
       
�#< 
�  1�
    AM �����
 � �  9� M ����P �����  !  ���=M 7���  ��>P ���� 
 33@P ���P ���P ���P ���P ���P ���P ���P ���P ���P ���  
�#< n����
[   [   [ 	  �  1 
     M ���@?  BONNETBTTF3 � 7  � 9   M .���7  	      ���7  	       
�#; 
 ��L=Q c   c   c 	  Q �  1 
     M j����  
 �  
 � 	 
 i   i   i 	  �  9�  M L����   i  
 i  
 [    L���             	     [   [   [ 	  �       �A[       	   	 @?  BONNETBTTF3 � 7  � 9   M ����7  	      ����7  	      
 ��L=  
�#;Q VAR '   PASSED_LAW1_THE_PARTY �   PASSED_LAW2_BACK_ALLEY_BRAWL �   PASSED_LAW3_JURY_FURY �   PASSED_LAW4_RIOT �   PASSED_COL1_TREACHEROUS_SWINE �   PASSED_COL2_MALL_SHOOTOUT �   PASSED_COL3_GUARDIAN_ANGELS �   PASSED_COL4_SIR_YES_SIR �   PASSED_COL5_ALL_HANDS_ON_DECK �   PASSED_COK1_THE_CHASE �   PASSED_COK2_PHNOM_PENH_86 �   PASSED_COK3_THE_FASTEST_BOAT �   PASSED_COK4_SUPPLY_AND_DEMAND �   PASSED_ASS1_RUB_OUT �   PASSED_KENT1_DEATH_ROW �   PASSED_TEX1_FOUR_IRON �   PASSED_HAT1_JUJU_SCRAMBLE   PASSED_HAT2_BOMBS_AWAY   PASSED_HAT3_DIRTY_LICKINS   PASSED_ROCK1_LOVE_JUICE    PASSED_ROCK2_PSYCHO_KILLER !  PASSED_ROCK3_PUBLICITY_TOUR "  PLAYER_CHAR    PLAYER_ACTOR    DEFAULT_WAIT_TIME    ONMISSION 9  CUT_SCENE_TIME |   CURRENT_TIME_IN_MS �  ARENA_DOOR_1    ARENA_DOOR_2    FILM_STUDIO_FRONT_GATE_CLOSED   FILM_STUDIO_BACK_GATE_CLOSED   FILM_STUDIO_FRONT_GATE_OPEN   FILM_STUDIO_BACK_GATE_OPEN   PRINT_WORKS_ASSET �  CAR_SHOWROOM_ASSET �  FILM_STUDIO_ASSET �  ICE_CREAM_FACTORY_ASSET �  LANCE_VANCE �   FLAG   SRC    {$CLEO .s}
{$INCLUDE ../Common/CleoConstants.txt}
0209: 10@ = random_int 0 10
0AB4: 1@ = var SPARK_REPEAT
while  003C:   1@ == 10@ 
    0209: 10@ = random_int 0 10
end

:SparksDeloreanCheck
if
   Car.Model(0@) == DELOREAN_MODEL
else_jump @SparksTrain
if
  10@ == 0 
else_jump @SparksDeloreanFrontCoil
1@ = 0.0 
2@ = -0.68 
3@ = 0.765 
4@ = 0.0 
5@ = 1.0 
6@ = -0.05 
12@ = 4.0 
15@ = 0.0 
jump @SparksCreate

:SparksDeloreanFrontCoil
if
  10@ == 1 
else_jump @SparksDeloreanSideCoilTop
0208: 1@ = random_float -0.8 0.8
2@ = 2.35 
3@ = -0.12 
0087: 4@ = 1@ 
4@ /= -2.0 
5@ = 1.0 
6@ = 0.2 
12@ = 1.0 
15@ = 0.0 
jump @SparksCreate

:SparksDeloreanSideCoilTop
if or
  10@ == 2 
  10@ == 3 
else_jump @SparksDeloreanSideCoilDoor
0208: 1@ = random_float -0.63 -0.3
if
  10@ == 3 
else_jump @SparksDeloreanSideCoilTopA
1@ *= -1.0 

:SparksDeloreanSideCoilTopA
2@ = -0.8 
3@ = 0.64 
0087: 4@ = 1@ 
4@ /= -5.0 
5@ = 1.0 
6@ = -0.05 
12@ = 4.0 
15@ = 0.0 
jump @SparksCreate

:SparksDeloreanSideCoilDoor
if or
  10@ == 4 
  10@ == 5 
else_jump @SparksDeloreanSideCoil
0208: 3@ = random_float 0.3 0.6
0087: 1@ = 3@ 
1@ *= -0.95 
1@ += 1.245 
0087: 2@ = 3@ 
2@ *= 0.1 
2@ -= 0.86 
if
  10@ == 5 
else_jump @SparksDeloreanSideCoilDoorA
1@ *= -1.0 

:SparksDeloreanSideCoilDoorA
0087: 4@ = 1@ 
4@ /= 10.0 
5@ = 1.0 
0087: 6@ = 3@ 
6@ /= -4.0 
12@ = 4.0 
0087: 15@ = 1@ 
15@ /= -15.0 
jump @SparksCreate

:SparksDeloreanSideCoil
if or
  10@ == 6 
  10@ == 7 
else_jump @SparksDeloreanSideCoilRear
0208: 2@ = random_float -0.975 -1.7
0087: 1@ = 2@ 
1@ *= -0.119 
1@ -= 1.122
3@ = 0.225 
if
  10@ == 7 
else_jump @SparksDeloreanSideCoilA
1@ *= -1.0 

:SparksDeloreanSideCoilA
0087: 4@ = 1@ 
4@ /= 4.0 
0087: 5@ = 2@ 
5@ *= -0.125 
5@ += 0.775 
6@ = 0.01 
12@ = 5.0 
0087: 15@ = 1@ 
15@ /= -15.0 
jump @SparksCreate

:SparksDeloreanSideCoilRear
0208: 2@ = random_float -1.82 -2.05
0087: 3@ = 2@ 
3@ *= 1.875 
3@ += 3.58325
0087: 1@ = 3@ 
if
  1@ >= 0.0
else_jump @SparksDeloreanSideCoilRearA
1@ *= 0.267
1@ -= 0.994 
jump @SparksDeloreanSideCoilBottom

:SparksDeloreanSideCoilRearA
1@ *= -0.289 
1@ -= 0.994 

:SparksDeloreanSideCoilBottom
if
  10@ == 9 
else_jump @SparksDeloreanSideCoilBottomA
1@ *= -1.0 

:SparksDeloreanSideCoilBottomA
0087: 4@ = 1@ 
4@ /= 4.0 
0087: 5@ = 2@ 
5@ = 1.0 
0087: 6@ = 3@ 
6@ /= -5.0 
12@ = 5.0 
0087: 15@ = 1@ 
15@ /= -15.0 
jump @SparksCreate

:SparksTrain
if
   Car.Model(0@) == JVT_MODEL
else_jump @SparksEnd
0208: 1@ = random_float -1.0 1.0
0087: 2@ = 1@ 
2@ *= 1.8 
if
  1@ >= 0.0 
else_jump @SparksTrainA
2@ *= -1.0 

:SparksTrainA
2@ += 10.9 
3@ = -1.0 
0087: 4@ = 1@ 
4@ /= -2.0 
5@ = 0.75 
6@ = 0.35 
12@ = 2.0 
15@ = 0.0 
jump @SparksCreate

:SparksCreate
0AB3: cleo_shared_var SPARK_REPEAT = 10@
10@ = 0.0 
11@ = 0.15 
02E3: 8@ = car 0@ speed
8@ /= 30.0 
005B: 8@ += 2@ 
0407: create_coordinate 7@ 8@ 9@ from_car 0@ offset 1@ 8@ 3@
3F40: 14@ = get_car 0@ component "bonnetbttf3" visiblility
if and
   Car.Model(0@) == DELOREAN_MODEL
   14@ == 0
then
    0437: scatter_particle 2 1.0 at 7@ 8@ 9@ 0 0 0
else
    0437: scatter_particle 11 1.0 at 7@ 8@ 9@ 0 0 0
end

:SparksSpeed
wait 10
if
0025:   12@ > 10@ 
else_jump @SparksBounce
0AB4: 14@ = var TRAVEL
if and
   not Car.Wrecked(0@)
   not 14@ == 1 
else_jump @SparksEnd
02E3: 14@ = car 0@ speed
14@ /= 30.0 
11@ = 0.15 
gosub @SparksCheckLength
11@ = 0.0725 

:SparksTrail
gosub @SparksCheckLength
if
   not 11@ > 0.01 
else_jump @SparksTrail
10@ += 2.3 
jump @SparksSpeed

:SparksBounce
if
   not Car.Wrecked(0@)
else_jump @SparksEnd
02E3: 14@ = car 0@ speed
14@ /= 30.0 
0087: 7@ = 10@ 
0087: 8@ = 10@ 
0087: 9@ = 10@ 
0069: 7@ *= 4@ 
0069: 8@ *= 5@ 
0069: 9@ *= 6@ 
0087: 13@ = 15@ 
0069: 13@ *= 10@ 
0069: 13@ *= 10@ 
005B: 7@ += 13@ 
005B: 7@ += 1@ 
005B: 8@ += 2@ 
005B: 9@ += 3@ 
8@ += 5.0 
0208: 5@ = random_float 0.0 180.0
02F6: 1@ = cosine 5@ // sinus swapped with cosine
02F7: 2@ = sinus 5@ // cosine swapped with sinus
5@ = -0.05 
0208: 4@ = random_float 0.1 0.3
0069: 4@ *= 2@ 
0208: 6@ = random_float 0.1 0.2
0069: 6@ *= 1@ 
4@ *= 0.1 
6@ *= 0.1 
005B: 4@ += 7@ 
005B: 5@ += 8@ 
005B: 6@ += 9@ 
0407: create_coordinate 4@ 5@ 6@ from_car 0@ offset 4@ 5@ 6@
0407: create_coordinate 7@ 8@ 9@ from_car 0@ offset 7@ 8@ 9@
0063: 4@ -= 7@ 
0063: 5@ -= 8@ 
0063: 6@ -= 9@ 
10@ = 0.0 
11@ = 0.01 

:SparksCheckDistance
wait 10
if
   not 10@ >= 10.0 
else_jump @SparksEnd
0AB4: 14@ = var TRAVEL
if and
   not Car.Wrecked(0@)
   not 14@ == 1 
else_jump @SparksEnd

:SparksDraw
gosub @SparksDrawHead
if
  11@ > 0.075 
else_jump @SparksDraw
11@ = 0.15 
gosub @SparksDrawHead
10@ += 2.3 
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
gosub @SparksUndoTrail
11@ = 0.01 
jump @SparksCheckDistance

:SparksEnd
terminate_this_custom_script

:SparksDrawHead
005B: 7@ += 4@ 
005B: 8@ += 5@ 
005B: 9@ += 6@ 
if
  10@ >= 0.0 
else_jump @SparksDrawHeadReturn
3F40: 14@ = get_car 0@ component "bonnetbttf3" visiblility
if and
   Car.Model(0@) == DELOREAN_MODEL
   14@ == 0
else_jump @SparksDrawHeadBlue
0437: scatter_particle 2 11@ at 7@ 8@ 9@ 0 0 0
jump @SparksDrawHeadReturn

:SparksDrawHeadBlue
0437: scatter_particle 11 11@ at 7@ 8@ 9@ 0 0 0

:SparksDrawHeadReturn
11@ += 0.0025 
10@ -= 0.05 
return

:SparksUndoTrail
0063: 7@ -= 4@ 
0063: 8@ -= 5@ 
0063: 9@ -= 6@ 
return

:SparksCheckLength
if
  10@ >= 0.0 
else_jump @SparksResetTrail
0087: 7@ = 10@ 
0087: 8@ = 10@ 
0087: 9@ = 10@ 
0069: 7@ *= 4@ 
0069: 8@ *= 5@ 
0069: 9@ *= 6@ 
if
   not 15@ == 0 
else_jump @SparksDrawTrail
0087: 13@ = 15@ 
0069: 13@ *= 10@ 
0069: 13@ *= 10@ 
005B: 7@ += 13@ 
jump @SparksDrawTrail

:SparksResetTrail
7@ = 0.0 
8@ = 0.0 
9@ = 0.0 

:SparksDrawTrail
005B: 7@ += 1@ 
005B: 8@ += 2@ 
005B: 9@ += 3@ 
02E3: 14@ = car 0@ speed
14@ /= 30.0 
005B: 8@ += 14@ 
0407: create_coordinate 7@ 8@ 9@ from_car 0@ offset 7@ 8@ 9@
3F40: 14@ = get_car 0@ component "bonnetbttf3" visiblility
if and
   Car.Model(0@) == DELOREAN_MODEL
   14@ == 0
else_jump @SparksDrawBlueTrail
0437: scatter_particle 2 11@ at 7@ 8@ 9@ 0 0 0
jump @SparksDrawTrailReturn

:SparksDrawBlueTrail
0437: scatter_particle 11 11@ at 7@ 8@ 9@ 0 0 0

:SparksDrawTrailReturn
10@ -= 0.05 
11@ -= 0.0025 
return
u
  __SBFTR 