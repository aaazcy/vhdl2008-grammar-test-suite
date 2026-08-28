-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Negative
-- Test Focus: procedure_call_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity procedure_call_e3 is end entity;
architecture bh of procedure_call_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;