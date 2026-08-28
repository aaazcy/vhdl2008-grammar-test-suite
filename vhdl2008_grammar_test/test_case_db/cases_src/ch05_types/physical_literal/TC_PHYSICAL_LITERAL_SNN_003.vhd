-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SNN_003
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Negative
-- Test Focus: Two unit names in sequence — physical_literal takes exactly ONE unit_name; concatenating two unit names (e.g., "5 ns us") is not valid
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity phys_lit_e3 is
  port(clk : in bit; val : out time);
end entity;
architecture bh of phys_lit_e3 is
  -- ERROR: Two unit names in physical literal — only one unit_name allowed
  signal t : time := 5 ns us;
begin
  val <= t;
end architecture bh;
