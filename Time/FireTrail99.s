       
           �     �O��    �>�  1�     M ����            �
  �
 	      ? 	    ?[   [  	   H�z�     7      ���>  H�z?     7      ���>�   k   [ 
      �?!    �BM �����  �    M �����      @�E �����
$?    �   �
 �
VAR '   ARENA_DOOR_1    ARENA_DOOR_2    CAR_SHOWROOM_ASSET �  CURRENT_TIME_IN_MS �  CUT_SCENE_TIME |   DEFAULT_WAIT_TIME    FILM_STUDIO_ASSET �  FILM_STUDIO_BACK_GATE_CLOSED   FILM_STUDIO_BACK_GATE_OPEN   FILM_STUDIO_FRONT_GATE_CLOSED   FILM_STUDIO_FRONT_GATE_OPEN   ICE_CREAM_FACTORY_ASSET �  LANCE_VANCE �   ONMISSION 9  PASSED_ASS1_RUB_OUT �   PASSED_COK1_THE_CHASE �   PASSED_COK2_PHNOM_PENH_86 �   PASSED_COK3_THE_FASTEST_BOAT �   PASSED_COK4_SUPPLY_AND_DEMAND �   PASSED_COL1_TREACHEROUS_SWINE �   PASSED_COL2_MALL_SHOOTOUT �   PASSED_COL3_GUARDIAN_ANGELS �   PASSED_COL4_SIR_YES_SIR �   PASSED_COL5_ALL_HANDS_ON_DECK �   PASSED_HAT1_JUJU_SCRAMBLE   PASSED_HAT2_BOMBS_AWAY   PASSED_HAT3_DIRTY_LICKINS   PASSED_KENT1_DEATH_ROW �   PASSED_LAW1_THE_PARTY �   PASSED_LAW2_BACK_ALLEY_BRAWL �   PASSED_LAW3_JURY_FURY �   PASSED_LAW4_RIOT �   PASSED_ROCK1_LOVE_JUICE    PASSED_ROCK2_PSYCHO_KILLER !  PASSED_ROCK3_PUBLICITY_TOUR "  PASSED_TEX1_FOUR_IRON �   PLAYER_ACTOR    PLAYER_CHAR    PRINT_WORKS_ASSET �  FLAG   SRC �  {$CLEO .s}
{$INCLUDE ../Common/CleoConstants.txt}
int vehicle
int vehicle_flags
float z_offset
float y_offset
float vehicle_speed
float x
float y
float z
float cos_angle
float sin_angle
float pitch_angle
float delta_angle
float pos

y_offset = 0.0
pitch_angle = 0.0    // Angle
delta_angle = 0.0    // Delta angle
02E3: vehicle_speed = car vehicle speed
vehicle_speed *= -0.0051975
vehicle_speed += 0.25
if
    vehicle_speed < 0.0
then
    vehicle_speed = 0.0
end
for pos = 0.0 to 100.0 step 1.0
    02F7: cos_angle = cosine pitch_angle
    02F6: sin_angle = sinus pitch_angle
    cos_angle *= 0.5
    sin_angle *= 0.5
    005B: y_offset += cos_angle
    005B: z_offset += sin_angle
    0407: create_coordinate x y z from_car vehicle offset -0.98 y_offset z_offset
    0437: scatter_particle 27 0.4 at x y z 0 0 0
    0407: create_coordinate x y z from_car vehicle offset 0.98 y_offset z_offset
    0437: scatter_particle 27 0.4 at x y z 0 0 0
    0087: delta_angle = pos
    006B: delta_angle *= vehicle_speed
    005B: pitch_angle += delta_angle
end
if
    Actor.InCar($PLAYER_ACTOR, vehicle)
then
    Car.PutAt(vehicle, x, y, 5000.0)
else
    0AB3: var REMOTE_TRAVEL = 1
    3F24: remove_car vehicle remote  // Give it a frame for all references to remote control to be removed, otherwise it crashes.
    wait 0
    Car.Destroy(vehicle)
    0AB3: var REMOTE_TRAVEL = 0
end
terminate_this_custom_script
r  __SBFTR 