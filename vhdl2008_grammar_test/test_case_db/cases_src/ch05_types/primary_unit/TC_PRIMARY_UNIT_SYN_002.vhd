-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit name in a physical type definition
-- Case Type: Positive
-- Test Focus: Primary unit used as both a bare physical literal and with abstract numeric prefix — exercises the dual role of the primary unit as unit_name in physical_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_unit_dual_usage is
  port(
    raw_val  : out integer;
    scaled   : out integer
  );
end entity;

architecture power_measurement of prim_unit_dual_usage is
  type t_power is range 0 to 1000000 units
    uW;            -- primary_unit
    mW = 1000 uW;
    W  = 1000 mW;
  end units;
  signal p_bare : t_power := uW;      -- bare primary unit as physical literal
  signal p_val  : t_power := 500 uW;   -- abstract_literal + unit_name
  signal p_sum  : t_power := 0 uW;
begin
  p_sum <= p_bare + p_val;
  raw_val <= integer(p_bare / uW);
  scaled  <= integer(p_sum / uW);
end architecture;
