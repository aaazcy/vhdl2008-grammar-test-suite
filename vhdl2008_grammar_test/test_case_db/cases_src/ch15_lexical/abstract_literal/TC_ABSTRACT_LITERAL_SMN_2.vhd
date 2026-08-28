-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: abstract_literal integer literal beyond integer range(2147483648 > 2^31-1): verify semantic analysis detects the literal value overflowing integer'high and reports a range error
-- Expected Result: Triggers semantic error on integer overflow
-- Dependencies: None
-- =============================================================
entity al_overflow_int is
  port (
    val : out integer
  );
end entity al_overflow_int;

architecture rtl of al_overflow_int is
  constant C_OVER : integer := 2147483648;
begin
  val <= C_OVER;
end architecture rtl;
