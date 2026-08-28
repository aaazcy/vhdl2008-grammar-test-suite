-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Rule Description: The assertion condition must be of type boolean; using a non-boolean expression causes a type error
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: assertion condition is of non-boolean type — in `assert data`, data is bit_vector, not boolean, verifying that the assert condition must be a boolean expression
-- Expected Result: Triggers type error: assertion condition must be boolean
-- Dependencies: None
-- =============================================================
entity ca_smn1_ent is
  port(data : in bit_vector(3 downto 0));
end entity ca_smn1_ent;
architecture bh of ca_smn1_ent is
begin
  assert data report "data check" severity error;
end architecture bh;
