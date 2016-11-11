#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Inventory Actions
GVAR(itemTypesCache) = [] call CBA_fnc_createNamespace;
["CAManBase", "InventoryOpened", {_this call FUNC(inventoryOpenedDelay)}] call CBA_fnc_addClassEventHandler;
["CAManBase", "InventoryClosed", {call FUNC(closeActionMenu)}] call CBA_fnc_addClassEventHandler;
