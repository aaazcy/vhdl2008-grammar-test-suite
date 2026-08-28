-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: if_generate_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity if_generate_sta_e3 is end entity;
architecture bh of if_generate_sta_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;