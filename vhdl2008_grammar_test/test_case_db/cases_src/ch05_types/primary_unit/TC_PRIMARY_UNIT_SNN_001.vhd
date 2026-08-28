-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit name
-- Case Type: Negative
-- Test Focus: Missing primary unit declaration — physical type requires at least one primary_unit_declaration; units...end units with no declared units is invalid
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity prim_unit_e1 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of prim_unit_e1 is
  type t_bad is range 0 to 1000 units
    -- ERROR: no primary unit declared
  end units;
  signal s : t_bad;
begin
  val <= 0;
end architecture bh;
