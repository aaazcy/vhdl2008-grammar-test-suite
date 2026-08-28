-- =============================================================
-- Case ID: TC_TERM_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Rule Description: mod and rem operators require both operands to be of the same integer type
-- Error Category: type_mismatch
-- Test Focus: mod operand type mismatch: integer and real are used with mod, but mod requires both sides to be of the same integer type
-- Expected Result: Triggers semantic error: mod requires integer type operands
-- Dependencies: None
-- =============================================================
entity term_smn2_ent is
  port(a : in integer; b : in real; y : out integer);
end entity;
architecture err of term_smn2_ent is
begin
  y <= a mod b;
end architecture err;
