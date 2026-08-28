-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: if_generate_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity if_generate_sta_e2 is end entity;
architecture bh of if_generate_sta_e2 is
  -- ERROR: invalid syntax in if_generate_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;