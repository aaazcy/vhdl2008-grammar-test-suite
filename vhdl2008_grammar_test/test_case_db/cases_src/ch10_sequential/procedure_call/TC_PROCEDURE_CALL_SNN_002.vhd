-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: procedure_call: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity procedure_call_e2 is end entity;
architecture bh of procedure_call_e2 is
  -- ERROR: invalid syntax in procedure_call
  signal s : bit;
begin
  s <= '1'
end architecture bh;