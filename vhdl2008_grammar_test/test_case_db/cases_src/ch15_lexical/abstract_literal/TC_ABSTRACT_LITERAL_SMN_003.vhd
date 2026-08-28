-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: extended_digit of based_literal in abstract_literal beyond the radix allowed range(in 2#201#, "2" is not in 0-1 allowed for base 2): verify semantic analysis detects the error of based_literal digits inconsistent with the base
-- Expected Result: Triggers semantic error on digit out of base range
-- Dependencies: None
-- =============================================================
entity al_digit_out_of_base is
  port (
    bad_val : out integer
  );
end entity al_digit_out_of_base;

architecture rtl of al_digit_out_of_base is
  constant C_BAD : integer := 2#201#;
begin
  bad_val <= C_BAD;
end architecture rtl;
