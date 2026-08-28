-- =============================================================
-- Case ID: TC_RELATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Rule Description: Matching operators (?=, ?/=, ?<, etc.) require array types with matching element base types
-- Error Category: type_mismatch
-- Test Focus: ?= type mismatch: bit_vector and std_ulogic_vector are compared with ?=, and the element types bit and std_ulogic differ
-- Expected Result: Triggers semantic error: matching operator requires compatible element types
-- Dependencies: None
-- =============================================================
entity rel_smn2_ent is
  port(a : in bit_vector(3 downto 0); b : in std_ulogic_vector(3 downto 0); r : out boolean);
end entity;
architecture err of rel_smn2_ent is
begin
  r <= a ?= b;
end architecture err;
