#include "script_component.hpp"

class RscText;
class RscActiveText;
class RscControlsGroupNoScrollbars;
class RscCombo;

class RscDisplayInventory {
    class controls {
        class ItemActionsGroup : RscControlsGroupNoScrollbars { //Shrink and expand the group to hide all at once
            idc = 422799;
            x = X_PART(0);
            y = Y_PART(0);
            w = W_PART(0);
            h = H_PART(0);

            class controls {
                class ItemActionsBackground : RscText {
                    idc = 422800;
                    x = W_PART(0);
                    y = H_PART(0);
                    w = W_PART(6);
                    h = H_PART(11);
                    colorBackground[] = {.05, .05, .05, 1};
                };
                class ItemActionsHeader1 : RscText {
                    idc = 422801;
                    x = W_PART(0);
                    y = H_PART(0);
                    w = W_PART(5.5);
                    h = H_PART(.8);
                    SizeEx =  H_PART(.75);
                    colorBackground[] = {1, 0, 0, .5};
                    colorText[] = {1, 1, 1, 1};
                    font = "TahomaB";
                    text = "My Title 1";
                };
                class ItemActionsHeader2 : ItemActionsHeader1 {
                    idc = 422802;
                    y = H_PART(.8);
                    colorBackground[] = {0, 1, 0, .5};
                    text = "My Title 2";
                };
                class ItemActionsClose : RscActiveText {
                    idc = 422803;
                    onButtonClick = "[] call ace_inventory_actions_fnc_closeActionMenu";
                    style = 48;
                    x = W_PART(5.5);
                    y = H_PART(0);
                    w = W_PART(.5);
                    h = H_PART(.5);
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
                    color[] = {1, 1, 1, 1};
                    colorText[] = {1, 1, 1, .8};
                    colorActive[] = {1, 0, 0, 1};
                    tooltip = "Close";
                };/*
                class ItemActionsMoveQuantity : RscCombo {
                    idc = 42804;
                    x = W_PART(4.5);
                    y = H_PART(1.75);
                    w = W_PART(1.25);
                    h = H_PART(1.0);
                    type = CT_COMBO;
                    style = ST_LEFT + LB_TEXTURES;
                    font = "RobotoCondensed";
                    sizeEx = "0.04";
                    shadow = 0;
                    colorText[] = {0, 0, 0, 1};
                    colorDisabled[] = {0, 0, 0, .25};
                    colorBackground[] = {.5, .5, .4, 1};
                    colorSelect[] = {0, 0, 0, 1};
                    colorSelectBackground[] = {.8, .8, .8, .75};
                    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
                    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
                    wholeHeight = safezoneH * 0.3;
                    maxHistoryDelay = 1;
                    text = "5";

                    class ComboScrollBar {
                        color[] = {1, 1, 1, 0.6};
                        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
                        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                    };
                };*/


                class ItemActionsButtonAction0 : RscActiveText {
                    idc = 422810;
                    x = W_PART(0);
                    y = H_PART(1.8);
                    w = W_PART(6);
                    h = H_PART(.7);
                    SizeEx =  H_PART(.85);
                    text = "Action 0";
                    style = 0x00;
                    soundDoubleClick[] = {"", .1, 1};
                    color[] = {1, 1, 1, .8};
                    colorText[] = {1, 1, 1, .8};
                    colorActive[] = {1, 1, 1, 1};
                };
                class ItemActionsButtonAction1 : ItemActionsButtonAction0 {
                    idc = 422811;
                    y =  H_PART(2.7);
                    text = "Action 1";
                };
                class ItemActionsButtonAction2 : ItemActionsButtonAction0 {
                    idc = 422812;
                    y =  H_PART(3.6);
                    text = "Action 2";
                };
                class ItemActionsButtonAction3 : ItemActionsButtonAction0 {
                    idc = 422813;
                    y =  H_PART(4.5);
                    text = "Action 3";
                };
                class ItemActionsButtonAction4 : ItemActionsButtonAction0 {
                    idc = 422814;
                    y =  H_PART(5.4);
                    text = "Action 4";
                };
                class ItemActionsButtonAction5 : ItemActionsButtonAction0 {
                    idc = 422815;
                    y =  H_PART(6.3);
                    text = "Action 5";
                };
                class ItemActionsButtonAction6 : ItemActionsButtonAction0 {
                    idc = 422816;
                    y =  H_PART(7.2);
                    text = "Action 6";
                };
                class ItemActionsButtonAction7 : ItemActionsButtonAction0 {
                    idc = 422817;
                    y =  H_PART(8.1);
                    text = "Action 7";
                };
                class ItemActionsButtonAction8 : ItemActionsButtonAction0 {
                    idc = 422818;
                    y =  H_PART(9.0);
                    text = "Action 8";
                };
                class ItemActionsButtonAction9 : ItemActionsButtonAction0 {
                    idc = 422819;
                    y =  H_PART(9.9);
                    text = "Action 9";
                };
            };
        };
    };
};




/*
class RscDisplayInventory {
    class controls {
        class ItemActionsBackground : RscText {
            idc = 4622800;
            x = X_PART(0);
            y = Y_PART(0);
            w = W_PART(8);
            h = H_PART(16);
            colorBackground[] = {0, 0, 0, 1};
        };

        class ItemActionsHeader1 : RscText {
            idc = 4622801;
            x =  X_PART(.25);
            y =  Y_PART(.25);
            w =  W_PART(7);
            h =  H_PART(1);
            SizeEx =  Y_PART(.75);
            colorBackground[] = {1, 0, 0, .5};
            colorText[] = {1, 1, 1, 1};
            font = "TahomaB";
            text = "My Title 1";
        };
        class ItemActionsHeader2 : ItemActionsHeader1 {
            idc = 4622802;
            y = Y_PART(1.25);
            colorBackground[] = {0, 1, 0, .5};
            text = "My Title 2";
        };
        class ItemActionsClose : RscActiveText {
            idc = 4622803
            onButtonClick = "[] call ace_inventory_actions_fnc_closeActionMenu";
            style = 48;
            x = X_PART(7);
            y = Y_PART(.25);
            w = W_PART(.75);
            h = H_PART(.75);
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, .8};
            colorActive[] = {1, 0, 0, 1};
            tooltip = "Close";
        };
        class ItemActionsMoveQuantity : RscCombo {
            idc = 4622804
            x =  X_PART(5.75);
            y =  Y_PART(2.5);
            w =  W_PART(2);
            h =  H_PART(2);
            type = CT_COMBO;
            style = ST_LEFT + LB_TEXTURES;
            font = "RobotoCondensed";
            sizeEx = "0.04";
            shadow = 0;
            colorText[] = {0, 0, 0, 1};
            colorDisabled[] = {0, 0, 0, 0.25};
            colorBackground[] = {0.5, 0.5, 0.4, 1};
            colorSelect[] = {0, 0, 0, 1};
            colorSelectBackground[] = {0.8, 0.8, 0.8, 0.75};
            arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
            arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
            wholeHeight = safezoneH * 0.3;
            maxHistoryDelay = 1;

            class ComboScrollBar {
                color[] = {1, 1, 1, 0.6};
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
            };
        };


        class ItemActionsButtonToGround : RscActiveText {
            idc = 4622811;
            //style = 1;
            x =  X_PART(.25);
            y =  Y_PART(2.25);
            w =  W_PART(7.5);
            h =  H_PART(1);
            SizeEx =  Y_PART(.8);
            text = "Drop on Ground";
            style = 0x00;
            soundDoubleClick[] = {"", 0.1, 1};
            color[] = {.2, .2, .2, 1};
            colorText[] = {1, 1, 1, .8};
            colorActive[] = {1, 1, 1, 1};
        };
        class ItemActionsButtonToContainer : ItemActionsButtonToGround {
            idc = 4622812;
            y =  Y_PART(3.25);
            text = "Move to Container";
        };
        class ItemActionsButtonToUniform : ItemActionsButtonToGround {
            idc = 4622813;
            y =  Y_PART(4.35);
            text = "Move to Uniform";
        };
        class ItemActionsButtonToVest : ItemActionsButtonToGround {
            idc = 4622814;
            y =  Y_PART(5.45);
            text = "Move to Vest";
        };
        class ItemActionsButtonToBackpack : ItemActionsButtonToGround {
            idc = 4622815;
            y =  Y_PART(6.55);
            text = "Move to Backpack";
        };


        class ItemActionsButtonAction1 : ItemActionsButtonToGround {
            idc = 4622816;
            y =  Y_PART(7.65);
            text = "Action 1";
        };
        class ItemActionsButtonAction2 : ItemActionsButtonToGround {
            idc = 4622817;
            y =  Y_PART(8.75);
            text = "Action 2";
        };
        class ItemActionsButtonAction3 : ItemActionsButtonToGround {
            idc = 4622818;
            y =  Y_PART(9.85);
            text = "Action 3";
        };
        class ItemActionsButtonAction4 : ItemActionsButtonToGround {
            idc = 4622819;
            y =  Y_PART(10.95);
            text = "Action 4";
        };
        class ItemActionsButtonAction5 : ItemActionsButtonToGround {
            idc = 4622820;
            y =  Y_PART(12.05);
            text = "Action 5";
        };
        class ItemActionsButtonAction6 : ItemActionsButtonToGround {
            idc = 4622821;
            y =  Y_PART(13.15);
            text = "Action 6";
        };
    };
};
