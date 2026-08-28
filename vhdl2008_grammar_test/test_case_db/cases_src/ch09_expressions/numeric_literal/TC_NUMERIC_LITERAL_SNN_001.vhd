-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Negative
-- Test Focus: SNN — based literal contains an illegal digit: the digit '2' in 2#1201# is not legal in the binary base, a binary digit can only be 0 or 1
-- Expected Result: Triggers syntax error: invalid digit '2' in base-2 literal
-- Dependencies: None
-- =============================================================
entity num_lit_snn_001 is
  port (
    x : out integer
  );
end entity num_lit_snn_001;

architecture invalid_digit of num_lit_snn_001 is
  -- ERROR: digit '2' is invalid in a binary (base-2) based literal
  constant C_BAD : integer := 2#1201#;
begin
  x <= C_BAD;
end architecture invalid_digit;
