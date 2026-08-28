-- =============================================================
-- Case ID: TC_BASED_INTEGER_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: based_integer is empty(16##) — BNF requires at least one extended_digit, an empty based_integer leaves the based_literal format incomplete; verify semantic analysis reports the missing integer part in the based literal
-- Expected Result: Triggers semantic error on empty based_integer
-- Dependencies: None
-- =============================================================
entity bi_empty_integer is
  port (
    bad_val : out integer
  );
end entity bi_empty_integer;

architecture rtl of bi_empty_integer is
  constant C_BAD : integer := 16##;
begin
  bad_val <= C_BAD;
end architecture rtl;
