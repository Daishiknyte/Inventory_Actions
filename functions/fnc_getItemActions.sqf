/*
 * Author: Daishiknyte
 * Core function for finding valid menu actions for the selected item.
 *
 * Arguments:
 * 0: _controlClickedIDC
 * 1: _itemData
 *
 * Return Value:
 * _availableActions
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_controlClickedIDC", "_itemData"];
_itemData params ["_iType", "_itemClass", "_itemCount", "_extraData"];

switch (_iType) do {
    case ("w"): {   // Weapons
        // Unload to
    };

    case ("ii"): {  // Items
        // Move to
        // Use Action
    };

    case ("ic"): {  // Uniforms and Vests
        // Unload to
    };

    case ("b"): {   // Backpacks
        // Unload to
    };
};
