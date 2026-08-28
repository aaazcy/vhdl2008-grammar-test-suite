-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: real type qualification: real'(3.14) adds a type qualification to a floating-point literal, verifying the qualified expression of a non-integer scalar type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_real is
  port (
    val : out real
  );
end entity ent_qe_real;

architecture real_qual of ent_qe_real is
begin
  val <= real'(3.14);
end architecture real_qual;
