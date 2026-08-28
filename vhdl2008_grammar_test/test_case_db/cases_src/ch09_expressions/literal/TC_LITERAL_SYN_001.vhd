-- =============================================================
-- Case ID: TC_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: minimal form: a single numeric_literal (integer constant 1) as a literal assigned to an integer port, verifying the most basic numeric_literal path of literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lit_minimal is
  port (
    x : out integer
  );
end entity lit_minimal;

architecture minimal of lit_minimal is
begin
  x <= 1;  -- numeric_literal as literal
end architecture minimal;
