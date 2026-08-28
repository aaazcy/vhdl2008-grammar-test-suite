-- =============================================================
-- Case ID: TC_BASED_INTEGER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: based_integer containing a space(16#F F#) — the extended_digit sequence cannot contain spaces, a space breaks the continuity of based_integer; verify the parser treats the space as the end of based_integer and triggers a subsequent syntax error
-- Expected Result: Triggers syntax error on space within based_integer
-- Dependencies: None
-- =============================================================
entity bi_space_inside is
  port (
    bad_val : out integer
  );
end entity bi_space_inside;

architecture rtl of bi_space_inside is
  constant C_BAD : integer := 16#F F#;
begin
  bad_val <= C_BAD;
end architecture rtl;
