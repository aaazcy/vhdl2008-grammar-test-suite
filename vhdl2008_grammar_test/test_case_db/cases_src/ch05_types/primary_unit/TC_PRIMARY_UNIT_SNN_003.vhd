-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SNN_003
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit — must be a simple identifier
-- Case Type: Negative
-- Test Focus: Primary unit name is a reserved word — VHDL reserved words cannot be used as identifiers including unit names; using 'range' as primary unit name is illegal
-- Expected Result: Triggers syntax error (reserved word used as identifier)
-- Dependencies: None
-- =============================================================
entity prim_unit_e3 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of prim_unit_e3 is
  type t_bad is range 0 to 1000 units
    -- ERROR: 'range' is a reserved word, not a valid identifier
    range;
    x10 = 10 range;
  end units;
  signal s : t_bad;
begin
  val <= 0;
end architecture bh;
