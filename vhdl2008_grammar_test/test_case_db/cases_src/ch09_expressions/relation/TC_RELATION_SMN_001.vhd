-- =============================================================
-- Case ID: TC_RELATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Negative
-- Rule Description: Both operands of a relational operator must be of the same type or compatible types
-- Error Category: type_mismatch
-- Test Focus: incomparable types: integer and bit_vector are compared with >, and the two types are not comparable
-- Expected Result: Triggers semantic error: operands of relational operator must be of compatible types
-- Dependencies: None
-- =============================================================
entity rel_smn1_ent is
  port(a : in integer; b : in bit_vector(3 downto 0); r : out boolean);
end entity;
architecture err of rel_smn1_ent is
begin
  r <= a > b;
end architecture err;
