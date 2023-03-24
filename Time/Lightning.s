         �
 � 9�  9   M �����?LIGHTNING.WAV  ^����  9   M y����?LIGHTNING_CUTSCENE.WAV  ^����?LIGHTNING_INSTANT.WAV i� � � � �    9   9   9�  M �����
d     p�   A  �@   _               X  �
g �
h �
i    jd  djd�  )� M ���� �
    M �����
 ��
 �
VAR '   ARENA_DOOR_1    ARENA_DOOR_2    CAR_SHOWROOM_ASSET �  CURRENT_TIME_IN_MS �  CUT_SCENE_TIME |   DEFAULT_WAIT_TIME    FILM_STUDIO_ASSET �  FILM_STUDIO_BACK_GATE_CLOSED   FILM_STUDIO_BACK_GATE_OPEN   FILM_STUDIO_FRONT_GATE_CLOSED   FILM_STUDIO_FRONT_GATE_OPEN   ICE_CREAM_FACTORY_ASSET �  LANCE_VANCE �   ONMISSION 9  PASSED_ASS1_RUB_OUT �   PASSED_COK1_THE_CHASE �   PASSED_COK2_PHNOM_PENH_86 �   PASSED_COK3_THE_FASTEST_BOAT �   PASSED_COK4_SUPPLY_AND_DEMAND �   PASSED_COL1_TREACHEROUS_SWINE �   PASSED_COL2_MALL_SHOOTOUT �   PASSED_COL3_GUARDIAN_ANGELS �   PASSED_COL4_SIR_YES_SIR �   PASSED_COL5_ALL_HANDS_ON_DECK �   PASSED_HAT1_JUJU_SCRAMBLE   PASSED_HAT2_BOMBS_AWAY   PASSED_HAT3_DIRTY_LICKINS   PASSED_KENT1_DEATH_ROW �   PASSED_LAW1_THE_PARTY �   PASSED_LAW2_BACK_ALLEY_BRAWL �   PASSED_LAW3_JURY_FURY �   PASSED_LAW4_RIOT �   PASSED_ROCK1_LOVE_JUICE    PASSED_ROCK2_PSYCHO_KILLER !  PASSED_ROCK3_PUBLICITY_TOUR "  PASSED_TEX1_FOUR_IRON �   PLAYER_ACTOR    PLAYER_CHAR    PRINT_WORKS_ASSET �  FLAG   SRC   {$CLEO .s}
{$INCLUDE ../Common/CleoConstants.txt}
0000:
int vehicle
int vehicle_flags
int fried_var
int tcon_var
int mode_var
float x
float y
float z
int times
0B10: fried_var = vehicle_flags AND TC_FRIED_BIT // Time Circuits Fried
0B10: tcon_var = vehicle_flags AND TC_BIT       // Time Circuits status
0AB4: mode_var = var MODE
if or
    not fried_var == 0 // Time Circuits are fried
    tcon_var == 0      // Time Circuits are off
then
    // Lightning sound
    3F84: play_sound "lightning.wav" loop 0
else if
    mode_var == 0 // Cutscene mode
then
    3F84: play_sound "lightning_cutscene.wav" loop 0
else
    3F84: play_sound "lightning_instant.wav" loop 0
end
end
0169: set_fade_color 255 255 255

// Set camera if we have functional time circuits for cutscene mode
if and
    Actor.InCar($PLAYER_ACTOR, vehicle)
    mode_var == 0     // Cutscene mode
    fried_var == 0    // Time Circuits are not fried
    not tcon_var == 0 // Time Circuits are on
then
    0AB3: var CAMERA_CONTROL = 0
    0407: create_coordinate x y z from_car vehicle offset -15.0 10.0 7.5
    Camera.SetPosition(x, y, z, 0.0, 0.0, 0.0)
    Camera.OnVehicle(vehicle, 15, 1)
    0AB3: var CAMX = x
    0AB3: var CAMY = y
    0AB3: var CAMZ = z
end

:LightningFlash
for times = 0 to 3 step 1
    fade 0 100
    wait 100
    fade 1 100
    if
        times < 3
    then
        wait 500
    end
end
0AB3: var LIGHTNING = 2
wait 5000
// Reset Lightning just in case
0AB3: var LIGHTNING = 0
terminate_this_custom_script
�  __SBFTR 