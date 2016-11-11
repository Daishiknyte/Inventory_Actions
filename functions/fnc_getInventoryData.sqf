/*
 * Author: Daishiknyte
 * Core function for turning available inventory commands into an array that
 * matches the list shown in the inventory dialog
 *
 * Arguments:
 * 0: _controlClickedIDC <SCALAR>
 * 1: _indexClicked <SCALAR>
 *
 * Return Value:
 * _inventoryData <ARRAY>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: Maybe
 */

#include "script_component"

params ["_controlClickedIDC", "_indexClicked"];

diag_log format ["=============================="];
diag_log format ["INV_ACT : fnc_getInventoryData"];
diag_log format ["   Params : %1 | %2", _containerIDC, _index];

private _weaponsList = [];
private _itemsList = [];
private _magazinesList = [];
private _backpacksList = [];
private _containersList = [];

// Fill list arrays using available inventory commands
switch (_containerIDC) do {
    case (IDC_CONTAINER_UNIFORM): {
        _weaponsList = weaponsItemsCargo (uniformContainer ACE_player);     // [[weapon, info],...]
        _itemsList = getItemCargo (uniformContainer ACE_player);            // [[Names],[Counts]]
        _magazinesList = magazinesAmmoCargo (uniformContainer ACE_player);  // [[mag,ammo],...]
        _backpacksList = everyBackpack (uniformContainer ACE_player);
        _containersList = everyContainer (uniformContainer ACE_player);
    };
    case (IDC_CONTAINER_VEST): {
        _weaponsList = weaponsItemsCargo (vestContainer ACE_player);
        _itemsList = getItemCargo (vestContainer ACE_player);
        _magazinesList = magazinesAmmoCargo (vestContainer ACE_player);
        _backpacksList = everyBackpack (vestContainer ACE_player);
        _containersList = everyContainer (vestContainer ACE_player);
    };
    case (IDC_CONTAINER_BACKPACK): {
        _weaponsList = weaponsItemsCargo (backpackContainer ACE_player);
        _itemsList = getItemCargo (backpackContainer ACE_player);
        _magazinesList = magazinesAmmoCargo (backpackContainer ACE_player);
        _backpacksList = everyBackpack (backpackContainer ACE_player);
        _containersList = everyContainer (backpackContainer ACE_player);
    };
    case (IDC_CONTAINER_GROUND): {
        _weaponsList = weaponsItemsCargo GVAR(primaryContainer);
        _itemsList = getItemCargo GVAR(primaryContainer);
        _magazinesList = magazinesAmmoCargo GVAR(primaryContainer);
        _backpacksList = everyBackpack GVAR(primaryContainer);
        _containersList = everyContainer GVAR(primaryContainer);
    };
    case (IDC_CONTAINER_CONTAINER): {
        _weaponsList = weaponsItemsCargo GVAR(secondaryContainer);
        _itemsList = getItemCargo GVAR(secondaryContainer);
        _magazinesList = magazinesAmmoCargo GVAR(secondaryContainer);
        _backpacksList = everyBackpack GVAR(secondaryContainer);
        _containersList = everyContainer GVAR(secondaryContainer);
    };
};

diag_log format ["   Source List Weapons    : %1", _weaponsList];
diag_log format ["   Source List Items      : %1", _itemsList];
diag_log format ["   Source List Magazines  : %1", _magazinesList];
diag_log format ["   Source List Backpacks  : %1", _backpacksList];
diag_log format ["   Source List Containers : %1", _containersList];

// Filter List arrays into format used for
private _inventoryData = [];
_inventoryData append ([_weaponsList] call FUNC(filterInventoryWeapons));
_inventoryData append ([_itemsList, _containersList] call FUNC(filterInventoryItems));
_inventoryData append ([_magazinesList] call FUNC(filterInventoryMagazines));
_inventoryData append ([_backpacksList] call FUNC(filterInventoryBackpacks));

diag_log "==========";
diag_log format ["   Inventory : %1", _inventoryData];
diag_log "==========";

// Return
_inventoryData
