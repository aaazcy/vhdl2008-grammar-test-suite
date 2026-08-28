-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Negative
-- Test Focus: procedure_call_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity procedure_call_e2 is end entity;
architecture bh of procedure_call_e2 is
  -- ERROR: invalid syntax in procedure_call_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;