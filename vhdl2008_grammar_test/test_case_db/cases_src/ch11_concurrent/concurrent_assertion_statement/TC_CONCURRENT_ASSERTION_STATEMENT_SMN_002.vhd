-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Rule Description: The severity level must be one of note, warning, error, or failure; using an undefined severity causes a semantic error
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: severity level uses an illegal value — `severity critical` is not a standard severity level, verifying that severity must be one of note/warning/error/failure
-- Expected Result: Triggers semantic error: invalid severity level "critical"
-- Dependencies: None
-- =============================================================
entity ca_smn2_ent is
  port(a, b : in bit);
end entity ca_smn2_ent;
architecture bh of ca_smn2_ent is
begin
  assert a = b report "mismatch" severity critical;
end architecture bh;
