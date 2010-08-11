_id = _this select 3;

switch (_id) do
{
	case (0) : { _handle = [allunits select (floor(random(count allunits)))] execVM "gcam.sqf" };
	case (1) : { _handle = [allunits select (floor(random(count allunits)))] execVM "gcam_auto.sqf" };
};
