-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDP_003
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: types referenced in entity_declarative_part must be declared before the reference
-- Case Type: Negative
-- Error Category: undeclared_identifier_error
-- Test Focus: Negative example: signal s_bad:t_missing in the entity declarative part references the undeclared type identifier t_missing, which is neither in the preceding declarations of entity_declarative_part nor in use_clause imports, verifying the analyzer enforces strict forward declaration semantic checks on the entity declarative part
-- Expected Result: Triggers semantic error: type t_missing not declared
-- Dependencies: None
-- =============================================================
entity edp_smn1_ent is
  port(clk:in bit);
  signal s_bad:t_missing;
end entity edp_smn1_ent;
architecture bh of edp_smn1_ent is
begin end architecture bh;
