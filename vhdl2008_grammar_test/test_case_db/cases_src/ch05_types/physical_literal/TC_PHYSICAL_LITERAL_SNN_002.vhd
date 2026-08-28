-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SNN_002
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Negative
-- Test Focus: Non-existent unit name — the unit_name token must reference a declared unit of the physical type; 'lightyear' is not a declared unit
-- Expected Result: Triggers error (undeclared identifier / unknown unit)
-- Dependencies: None
-- =============================================================
entity phys_lit_e2 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of phys_lit_e2 is
  type t_dist is range 0 to 1000000 units
    m;
    km = 1000 m;
  end units;
  -- ERROR: 'lightyear' is not a declared unit of t_dist
  signal d : t_dist := 1 lightyear;
begin
  val <= 0;
end architecture bh;
