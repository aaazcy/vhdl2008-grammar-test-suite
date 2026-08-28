-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: minimal form: integer'(42), the minimal form of a qualified expression — adding a type qualification to a single-value expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_int is
  port (
    y : out integer
  );
end entity ent_qe_int;

architecture simple_qual of ent_qe_int is
begin
  y <= integer'(42);
end architecture simple_qual;
