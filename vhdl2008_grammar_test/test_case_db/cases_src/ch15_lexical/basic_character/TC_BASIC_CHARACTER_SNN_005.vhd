-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Negative
-- Test Focus: unclosed quote in a basic_character string — string literal "HELLO lacks the closing double quote, verify the lexical analyzer detects a string-not-terminated error while scanning the basic character sequence
-- Expected Result: Triggers syntax error on unterminated string
-- Dependencies: None
-- =============================================================
entity bc_unterminated_str is
  port (
    bad_val : out string(1 to 5)
  );
end entity bc_unterminated_str;

architecture rtl of bc_unterminated_str is
  constant C_BAD : string(1 to 5) := "HELLO;
begin
  bad_val <= C_BAD;
end architecture rtl;
