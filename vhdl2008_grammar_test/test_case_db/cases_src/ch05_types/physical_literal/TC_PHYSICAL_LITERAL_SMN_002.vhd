-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SMN_002
-- Related Rule ID: SMN_PHYSICAL_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Negative
-- Test Focus: Static model negative -- physical literal with undefined
--            unit_name. The unit 'lightyears' is not defined in any
--            physical type declaration accessible at this scope, causing
--            an undefined unit error.
-- Expected Result: Triggers undefined unit error
-- Dependencies: None
-- =============================================================
entity phys_lit_smn_bad_unit is
  port ( dout : out integer );
end entity phys_lit_smn_bad_unit;
architecture rtl of phys_lit_smn_bad_unit is
  constant C_BAD : time := 10 lightyears;  -- ERROR: lightyears not a time unit
  signal s : time;
begin
  s <= C_BAD;
  dout <= 0;
end architecture rtl;
