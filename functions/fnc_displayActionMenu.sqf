
// For Testing - Move to function later
(ctrlPosition _control) params ["_controlX", "_controlY", "_controlW", "_controlH"];
private _menuX = _controlX + _controlW + W_PART(.1);       // Right side of control + gap
private _menuY = (getMousePosition select 1) - H_PART(1.5);
private _menuW = ACTION_MENU_WIDTH;
private _menuH = ACTION_MENU_HEIGHT_TITLE1 + ACTION_MENU_HEIGHT_TITLE2 + (ACTION_MENU_HEIGHT_ACTION * 10); // full length for now, will edit to adjust based on shown rows

// Done in 2 steps to reduce on screen visible movement
(DISPLAY_INVENTORY displayCtrl IDC_ACTIONS_GROUP) ctrlSetPosition [_menuX, _menuY, 0, 0];
(DISPLAY_INVENTORY displayCtrl IDC_ACTIONS_GROUP) ctrlCommit 0;
(DISPLAY_INVENTORY displayCtrl IDC_ACTIONS_GROUP) ctrlSetPosition [_menuX, _menuY, _menuW, _menuH];
(DISPLAY_INVENTORY displayCtrl IDC_ACTIONS_GROUP) ctrlCommit 0;
