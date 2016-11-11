/*
 * Author: Daishiknyte
 * Converts weaponsItemsCargo into a format usable for referencing the inventory
 * dialog lists.
 *
 * Arguments:
 * 0: _weaponsList <ARRAY>
 *
 * Return Value:
 * _filteredList <ARRAY>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_weaponsList"];

private _filteredList = [];
private _iCount = count _weaponsList;

private _curr = [];
private _currData = [];
private _currMags = [];
private _next = [];
private _nextData = [];
private _nextMags = [];

private _trackMags = [];
private _counter = 1;

diag_log format ["===================="];
diag_log format ["fnc_filterInventoryWeapons"];
diag_log format ["   params : %1", _weaponsList];
diag_log format ["   iCount : %1", _iCount];


switch (_iCount) do {
    case (0): {
        diag_log format ["   Case 0"];
        diag_log format ["     Do nothing."];
    };

    case (1): {
        diag_log format ["   Case 1"];
        _curr = _weaponsList select 0;
        if (count _curr == 6) then {_currData = [_curr select 0, _curr select 1, _curr select 2, _curr select 3, _curr select 5]; _currMags = [_curr select 4];
            } else {_currData = [_curr select 0, _curr select 1, _curr select 2, _curr select 3, _curr select 6]; _currMags = [_curr select 4, _curr select 5];
        };
        diag_log format ["     _curr : %1 | %2", _currData, _currMags];

        _filteredList pushBack ["w", _currData, 1, [_currMags]];
    };

    case (2): {
        diag_log format ["   Case 2"];

        _curr = _weaponsList select 0;
        if (count _curr == 6) then {_currData = [_curr select 0, _curr select 1, _curr select 2, _curr select 3, _curr select 5]; _currMags = [_curr select 4];
            } else {_currData = [_curr select 0, _curr select 1, _curr select 2, _curr select 3, _curr select 6]; _currMags = [_curr select 4, _curr select 5];
        };
        diag_log format ["     _curr : %1 | %2", _currData, _currMags];;

        _next = _weaponsList select 1;
        if (count _next == 6) then {_nextData = [_next select 0, _next select 1, _next select 2, _next select 3, _next select 5]; _nextMags = [_next select 4];
            } else {_nextData = [_next select 0, _next select 1, _next select 2, _next select 3, _next select 6]; _nextMags = [_next select 4, _next select 5];
        };
        diag_log format ["     _next : %1 | %2", _nextData, _nextMags];

        if (_curr isEqualTo _next) then {
            _filteredList pushBack ["w", _currData, 2, [_currMags, _nextMags]];
        } else {
            _filteredList pushBack ["w", _currData, 1, [_currMags]];
            _filteredList pushBack ["w", _nextData, 1, [_nextMags]];
        };
    };

    default {
        diag_log format ["   Case Default"];

        _curr = _weaponsList select 0;
        if (count _curr == 6) then {_currData = [_curr select 0, _curr select 1, _curr select 2, _curr select 3, _curr select 5]; _currMags = [_curr select 4];
            } else {_currData = [_curr select 0, _curr select 1, _curr select 2, _curr select 3, _curr select 6]; _currMags = [_curr select 4, _curr select 5];
        };

        for "_i" from 1 to (_iCount - 2) do {
            diag_log format ["     _curr : %1 | %2", _currData, _currMags];

            _next = _weaponsList select _i;
            if (count _next == 6) then {_nextData = [_next select 0, _next select 1, _next select 2, _next select 3, _next select 5]; _nextMags = [_next select 4];
                } else {_nextData = [_next select 0, _next select 1, _next select 2, _next select 3, _next select 6]; _nextMags = [_next select 4, _next select 5];
            };
            diag_log format ["     _next : %1 | %2", _nextData, _nextMags];

            if (_curr isEqualTo _next) then {
                _counter = _counter + 1;
                _trackMags pushBack _currMags;
            } else {
                _filteredList pushBack ["w", _currData, _counter, _trackMags];
                _counter = 1;
                _trackmags = [];
            };

            _curr = _next;
            _currData = _nextData;
            _currMags = _nextMags;
        };

        // Special Case - Last 2
        diag_log format ["     _curr : %1 | %2", _currData, _currMags];

        _next = _weaponsList select (_icount-1);
        if (count _next == 6) then {_nextData = [_next select 0, _next select 1, _next select 2, _next select 3, _next select 5]; _nextMags = [_next select 4];
            } else {_nextData = [_next select 0, _next select 1, _next select 2, _next select 3, _next select 6]; _nextMags = [_next select 4, _next select 5];
        };
        diag_log format ["     _next : %1 | %2", _nextData, _nextMags];

        if (_curr isEqualTo _next) then {
            _counter = _counter + 1;
            _trackMags pushBack _currMags;
            _trackmags pushBack _nextMags;
            _filteredList pushBack ["w", _currData, _counter, _trackMags];

        } else {
            _filteredList pushBack ["w", _currData, _counter, _trackMags];
            _filteredList pushBack ["w", _nextData, 1, [_nextMags]];
        };
    };
};


// Return
_filteredList
