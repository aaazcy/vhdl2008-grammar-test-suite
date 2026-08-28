-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: bit_vector aggregate qualification: bit_vector'(x"A5") adds a type qualification to an array aggregate, verifying the type_mark ' aggregate form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_bvagg is
  port (
    dout : out bit_vector(7 downto 0)
  );
end entity ent_qe_bvagg;

architecture bv_agg of ent_qe_bvagg is
begin
  dout <= bit_vector'(x"A5");
end architecture bv_agg;
