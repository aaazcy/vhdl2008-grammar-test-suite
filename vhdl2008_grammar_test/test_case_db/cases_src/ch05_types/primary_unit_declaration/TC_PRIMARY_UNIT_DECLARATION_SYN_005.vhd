-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: Two independent physical types each with their own
--            primary_unit_declaration — tests scoping of base unit names
--            across separate physical type definitions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dual_sensor_node is
  port (
    temp_raw : out integer;
    dist_raw : out integer
  );
end entity dual_sensor_node;

architecture sensor_fusion of dual_sensor_node is
  type t_temperature is range 0 to 1000000 units
    celsius;                      -- primary_unit_declaration for temperature type
    kelvin = 274 celsius;          -- secondary
  end units;

  type t_distance is range 0 to 100000000 units
    meter;                        -- primary_unit_declaration for distance type
    km = 1000 meter;              -- secondary
    cm = 10 meter;                -- secondary
  end units;

  signal s_temp : t_temperature := 0 celsius;
  signal s_dist : t_distance    := 0 meter;
begin
  s_temp   <= 25 celsius after 1 ns;
  s_dist   <= 1500 meter after 1 ns;
  temp_raw <= t_temperature'pos(s_temp);
  dist_raw <= t_distance'pos(s_dist);
end architecture sensor_fusion;
