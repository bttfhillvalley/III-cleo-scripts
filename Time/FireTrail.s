  �  >?  M ����   ����   3?          ?     ?     ?  H�z?          H�z�      	 
 �  �    M M����      @�E �����
$?  �?)DELOREAN/LANDSPEEDER_LOOP_LOWER_PITCH.WAV  �?DELOREAN/ENGINE_IDLE.WAV    �   �
     
�
����        �
����     	 
  
    2M ����   �
 �  9   M ���� � 9   9  9  M ���� ���� 
�
 �  9   M �����  )�  NM �����  )  � M :���      �
Y���        �
Y���     	 
  
    2M ���� :���P F���   P ����P ���
    M �����
  P F���P �����
     P ���
      M ?���P ����Q [   [   [   Q 7      ���>Q �
VAR '   ARENA_DOOR_1    ARENA_DOOR_2    CAR_SHOWROOM_ASSET �  CURRENT_TIME_IN_MS �  CUT_SCENE_TIME |   DEFAULT_WAIT_TIME    FILM_STUDIO_ASSET �  FILM_STUDIO_BACK_GATE_CLOSED   FILM_STUDIO_BACK_GATE_OPEN   FILM_STUDIO_FRONT_GATE_CLOSED   FILM_STUDIO_FRONT_GATE_OPEN   ICE_CREAM_FACTORY_ASSET �  LANCE_VANCE �   ONMISSION 9  PASSED_ASS1_RUB_OUT �   PASSED_COK1_THE_CHASE �   PASSED_COK2_PHNOM_PENH_86 �   PASSED_COK3_THE_FASTEST_BOAT �   PASSED_COK4_SUPPLY_AND_DEMAND �   PASSED_COL1_TREACHEROUS_SWINE �   PASSED_COL2_MALL_SHOOTOUT �   PASSED_COL3_GUARDIAN_ANGELS �   PASSED_COL4_SIR_YES_SIR �   PASSED_COL5_ALL_HANDS_ON_DECK �   PASSED_HAT1_JUJU_SCRAMBLE   PASSED_HAT2_BOMBS_AWAY   PASSED_HAT3_DIRTY_LICKINS   PASSED_KENT1_DEATH_ROW �   PASSED_LAW1_THE_PARTY �   PASSED_LAW2_BACK_ALLEY_BRAWL �   PASSED_LAW3_JURY_FURY �   PASSED_LAW4_RIOT �   PASSED_ROCK1_LOVE_JUICE    PASSED_ROCK2_PSYCHO_KILLER !  PASSED_ROCK3_PUBLICITY_TOUR "  PASSED_TEX1_FOUR_IRON �   PLAYER_ACTOR    PLAYER_CHAR    PRINT_WORKS_ASSET �  FLAG   SRC �  {$CLEO .s}
{$INCLUDE ../Common/CleoConstants.txt}
const
    FIRETRAIL_SPEED = 4
end
0000:
int vehicle
float z_offset
float vx
float vy
float vz
float x1
float y1
float z1
float x2
float y2
float z2
int grounded
int global_var
int weather
int pos
// vehicle is for the car, but will be forgotten once we start the firetrail
// 1@ is for the car model, and later whatever flag we use to tell if the car is flying or not
// 2@-4@ is to remember the delta for the firetrail direction
// 5@-7@ is where the right firetrail currently is
// 8@-1vehicle is where the left firetrail currently is
// 11-13@ is reserved for drawing the firetrail
// Left with 3 variables to play around with (after vehicle gets released)

// Controls how fast the firetrail forms.   Unfortunately, we are at the whims of the particle limit for now which does put a damper
// on how long it can be.
// Only persist firetrails if the car is grounded
if
    3F3E: car vehicle wheels_on_ground
then
    grounded = 1
else
    grounded = 0
end

// Calculate Delta
3F33: get_car vehicle velocity_direction vx vy vz
vx *= 0.5
vy *= 0.5
vz *= 0.5

0407: create_coordinate x1 y1 z1 from_car vehicle offset 0.98 0.0 z_offset
0407: create_coordinate x2 y2 z2 from_car vehicle offset -0.98 0.0 z_offset

// Figure out what to do with the car now that we have the coordinates
// This frees up vehicle to be anything
if
    Actor.InCar($PLAYER_ACTOR, vehicle)
then
    Car.PutAt(vehicle, x1, y1, 5000.0)
else
    0AB3: var REMOTE_TRAVEL = 1
    3F24: remove_car vehicle remote  // Give it a frame for all references to remote control to be removed, otherwise it crashes.
    3F91: stop_sound "delorean/landspeeder_loop_lower_pitch.wav" index vehicle
    3F91: stop_sound "delorean/engine_idle.wav" index vehicle
    wait 0
    Car.Destroy(vehicle)
    0AB3: var REMOTE_TRAVEL = 0
end

// Draw the firetrail
for pos = 0 to 50 step FIRETRAIL_SPEED
    wait 10   // Wait a little so the firetrail shows up slowly
    cleo_call @FireTrailRun params_count 7 pos vx vy vz x1 y1 z1
    cleo_call @FireTrailRun params_count 7 pos vx vy vz x2 y2 z2
end

// Now do we keep the fire lit for a few seconds?
timera = 0

// Keep it lit after the lightning strike.

0AB4: global_var = var WIRE
if
    global_var == 0 // integer values
else_jump @FireTrailProlong

//  Get rid of it if we're flying or if its raining
0607: weather = get_current_weather
if or
    grounded == 0
    weather == 2 // integer values
    weather == 5 // integer values
else_jump @FireTrailProlong
jump @FireTrailEnd

:FireTrailDisplay
wait 10
0AB4: global_var = var SET_TIME
if
  global_var == 0 // integer values
else_jump @FireTrailEnd
if
    timera < 20000
else_jump @FireTrailEnd
if
    timerb >= 200
else_jump @FireTrailDisplay


:FireTrailProlong
timerb = 0
for pos = 0 to 50 step 1  // Note that we use 14@ here instead of vehicle like above
    // Unlike the other one, there is no wait.
    cleo_call @FireTrailStay params_count 7 pos vx vy vz x1 y1 z1
    cleo_call @FireTrailStay params_count 7 pos vx vy vz x2 y2 z2
end
jump @FireTrailDisplay

// ========================================================================================

:FireTrailRun
// To make the fire trail form fastrer, we draw 2 new ones every frame.
gosub @FireTrailLoopCoords
for 14@ = 0 to FIRETRAIL_SPEED step 1
    gosub @FireTrailCreate
    gosub @FireTrailNextCoords
end
cleo_return 0

:FireTrailStay
// This is for the fire trail that stays after the entire trail has formed.
gosub @FireTrailLoopCoords
gosub @FireTrailCreate
cleo_return 0

:FireTrailLoopCoords
// This loop is to go to the next position starting from the initial spot.
for 15@ = 0 to 0@ step 1
    gosub @FireTrailNextCoords
end
gosub @FireTrailCreate
return

:FireTrailNextCoords
005B: 4@ += 1@ // floating-point values (never used in VC or GTA 3)
005B: 5@ += 2@ // floating-point values (never used in VC or GTA 3)
005B: 6@ += 3@ // floating-point values (never used in VC or GTA 3)
return

:FireTrailCreate
0437: scatter_particle 27 0.4 at 4@ 5@ 6@ 0 0 0
return

:FireTrailEnd
terminate_this_custom_script
  __SBFTR 