-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: decimal_literal in abstract_literal with two consecutive decimal points(1..5) forms an illegal real, verify the double dot is rejected as a syntax error in an integer range
-- Expected Result: Triggers syntax error on double-dot malformed literal
-- Dependencies: None
-- =============================================================
entity al_double_dot is
  port (
    bad_val : out integer
  );
end entity al_double_dot;

architecture rtl of al_double_dot is
  constant C_BAD : integer := 1..5;
begin
  bad_val <= C_BAD;
end architecture rtl;
