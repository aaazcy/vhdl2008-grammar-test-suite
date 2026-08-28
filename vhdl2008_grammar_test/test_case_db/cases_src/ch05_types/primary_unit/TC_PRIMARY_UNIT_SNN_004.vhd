-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit (appears as primary_unit_declaration ::= identifier ;)
-- Case Type: Negative
-- Test Focus: Two primary unit declarations — only ONE primary unit is allowed per physical type; declaring a second bare identifier without = makes two primary units
-- Expected Result: Triggers semantic error
-- Dependencies: None
-- =============================================================
entity prim_unit_e4 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of prim_unit_e4 is
  type t_bad is range 0 to 1000 units
    nA;       -- primary_unit_declaration (OK)
    uA;       -- ERROR: second primary_unit_declaration — must use = for secondary units
    mA = 1000 uA;
  end units;
  signal s : t_bad;
begin
  val <= 0;
end architecture bh;
