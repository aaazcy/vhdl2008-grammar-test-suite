-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Negative
-- Test Focus: Syntax error -- physical literal with numeric value
--            but missing unit_name. The grammar requires the unit_name
--            to be present; a bare number in a physical context is
--            not a valid physical_literal.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity phys_lit_snn_no_unit is
end entity phys_lit_snn_no_unit;
architecture rtl of phys_lit_snn_no_unit is
  constant C_BAD : time := 10;  -- ERROR: bare integer without unit (ns, us, etc.)
  signal s : time;
begin
  s <= C_BAD;
end architecture rtl;
