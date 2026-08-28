-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_QUALIFIED_EXPRESSION_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Rule Description: When using the aggregate form of a qualified expression, the aggregate elements must match the target type's element types.
-- Error Category: Aggregate element type mismatch
-- Test Focus: SMN: qualified aggregate element type mismatch — in bit_vector'(1, 0, 1) integer elements cannot be used in a bit_vector aggregate
-- Expected Result: Triggers type error: aggregate element type does not match target composite element type
-- Dependencies: None
-- =============================================================

entity ent_qe_smn_002 is
  port (y : out bit_vector(2 downto 0));
end entity ent_qe_smn_002;

architecture agg_mismatch of ent_qe_smn_002 is
begin
  -- ERROR: Integer elements not valid for bit_vector aggregate
  y <= bit_vector'(1, 0, 1);
end architecture agg_mismatch;
