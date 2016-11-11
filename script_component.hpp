#define COMPONENT inventory_actions
#define COMPONENT_BEAUTIFIED InventoryActions
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

//#ifdef DEBUG_ENABLED_INVENTORY
    #define DEBUG_MODE_FULL
//#endif

///#ifdef DEBUG_SETTINGS_INVENTORY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INVENTORY
//#endif

#include "\z\ace\addons\main\script_macros.hpp"

// Menu sizing
#define SIZEX ((safezoneW / safezoneH) min 1.2) // Grid width (from aspect ratio, 1.2 clamp for the largest possible size)
#define SIZEY (SIZEX / 1.2) // Grid height (from width)
#define W_PART(num) (num * (SIZEX / 40)) // Split grid into 40 columns
#define H_PART(num) (num * (SIZEY / 25)) // Split grid into 25 rows
#define X_PART(num) (W_PART(num) + (safezoneX + (safezoneW - SIZEX)/2)) // Translate by columns and find left of grid
#define Y_PART(num) (H_PART(num) + (safezoneY + (safezoneH - SIZEY)/2)) // Translate by rows and find top of grid
#define ACTION_MENU_WIDTH (W_PART(6))
#define ACTION_MENU_HEIGHT_TITLE1 (H_PART(1.2))
#define ACTION_MENU_HEIGHT_TITLE2 (H_PART(1))
#define ACTION_MENU_HEIGHT_ACTION (H_PART(1))

//RscDisplayInventory
#define DISPLAY_INVENTORY               (findDisplay 602)
#define IDC_SLOT_PRIMARY                610
#define IDC_SLOT_SECONDARY              611
#define IDC_SLOT_HANDGUN                612
#define IDC_CONTAINER_BACKPACK          619     // Backpack list of items
#define IDC_SLOT_PRIMARY_MUZZLE         620
#define IDC_SLOT_PRIMARY_OPTICS         621
#define IDC_SLOT_PRIMARY_FLASHLIGHT     622
#define IDC_SLOT_PRIMARY_MAGAZINE       623
#define IDC_SLOT_SECONDARY_MUZZLE       624
#define IDC_SLOT_SECONDARY_OPTIC        625
#define IDC_SLOT_SECONDARY_FLASHLIGHT   626
#define IDC_SLOT_SECONDARY_MAGAZINE     627
#define IDC_SLOT_HANDGUN_MUZZLE         628
#define IDC_SLOT_HANDGUN_OPTICS         629
#define IDC_SLOT_HANDGUN_FLASHLIGHT     630
#define IDC_SLOT_HANDGUN_MAGAZINE       631
#define IDC_CONTAINER_GROUND            632
#define IDC_CONTAINER_UNIFORM           633
#define IDC_CONTAINER_VEST              638
#define IDC_CONTAINER_CONTAINER         640
#define IDC_SLOT_PRIMARY_UNDERBARREL    641
#define IDC_SLOT_SECONDARY_UNDERBARREL  642
#define IDC_SLOT_HANDGUN_UNDERBARREL    643
#define IDC_SLOT_PRIMARY_MAGAZINEGL     644
#define IDC_SLOT_BACKPACK               6191    // Backpack slot in top row of inventory
//#define IDC_TAB_BACKPACK                6192
#define IDC_SLOT_MAP                    6211
#define IDC_SLOT_COMPASS                6212
#define IDC_SLOT_WATCH                  6213
#define IDC_SLOT_RADIO                  6214
#define IDC_SLOT_GPS                    6215
#define IDC_SLOT_GOGGLES                6216
#define IDC_SLOT_HMD                    6217
#define IDC_SLOT_BINOCULARS             6238
#define IDC_SLOT_HEADGEAR               6240
#define IDC_LOAD_UNIFORM                6304
#define IDC_LOAD_VEST                   6305
#define IDC_LOAD_BACKPACK               6306
#define IDC_LOAD_GROUND                 6307
#define IDC_LOAD_TOTAL                  6308
#define IDC_TAB_GROUND                  6321
#define IDC_SLOT_UNIFORM                6331
///#define IDC_TAB_UNIFORM                 6332
#define IDC_SLOT_VEST                   6381
///#define IDC_TAB_VEST                    6382
#define IDC_TAB_CONTAINER               6401
//#define IDC_FILTER_GROUND               6554

// Settings
#define DISPLAY_TIMEOUT                 2       // # second timeout, use with diag_tickTime
#define DOUBLE_CLICK_TIMEOUT            .5      // # second timeout, used for detecting double clicks
#define MAX_ACTIONS                     10      // # actions allowed in the actions box

//Added controls INACT##
#define IDC_ACTIONS_GROUP               422799
#define IDC_ACTIONS_BACKGROUND          422800
#define IDC_ACTIONS_HEADER_1            422801
#define IDC_ACTIONS_HEADER_2            422802
#define IDC_ACTIONS_CLOSE               422803
#define IDC_ACTIONS_MOVE_QUANTITY       422804
#define IDC_ACTIONS_ACTION_0            422810
#define IDC_ACTIONS_ACTION_1            422811
#define IDC_ACTIONS_ACTION_2            422812
#define IDC_ACTIONS_ACTION_3            422813
#define IDC_ACTIONS_ACTION_4            422814
#define IDC_ACTIONS_ACTION_5            422815
#define IDC_ACTIONS_ACTION_6            422816
#define IDC_ACTIONS_ACTION_7            422817
#define IDC_ACTIONS_ACTION_8            422818
#define IDC_ACTIONS_ACTION_9            422819
