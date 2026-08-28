-- =============================================================
-- Case ID: TC_BASED_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Negative
-- Test Focus: based_literal missing the closing hash(2#1010) — only the left hash # exists with no right hash #, verify the parser reports a syntax error when it expects the closing right # in based_literal but encounters another token
-- Expected Result: Triggers syntax error on missing closing #
-- Dependencies: None
-- =============================================================
entity bl_missing_close is
  port (
    bad_val : out integer
  );
end entity bl_missing_close;

architecture rtl of bl_missing_close is
  constant C_BAD : integer := 2#1010;
begin
  bad_val <= C_BAD;
end architecture rtl;
