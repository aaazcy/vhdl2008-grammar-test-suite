-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Negative
-- Test Focus: Abstract literal with illegal based literal — abstract_literal must be a valid decimal or based literal; an unclosed based literal like 16#FF is not valid
-- Expected Result: Triggers syntax error (unclosed based literal)
-- Dependencies: None
-- =============================================================
entity phys_lit_e4 is
  port(clk : in bit; val : out time);
end entity;
architecture bh of phys_lit_e4 is
  -- ERROR: unclosed based literal — missing closing #
  signal t : time := 16#FF ns;
begin
  val <= t;
end architecture bh;
