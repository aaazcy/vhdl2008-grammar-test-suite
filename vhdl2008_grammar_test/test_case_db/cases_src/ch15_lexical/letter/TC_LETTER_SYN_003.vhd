-- =============================================================
-- Case ID: TC_LETTER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Positive
-- Test Focus: Lowercase letter as a character literal — testing the lower_case_letter branch, lowercase letters may be used in character literals
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity let_lower_char is
  port (
    char_out : out character
  );
end entity let_lower_char;

architecture rtl of let_lower_char is
  constant C_A : character := 'a';
  constant C_Z : character := 'z';
  signal s_ch  : character := 'x';
begin
  s_ch    <= C_A;
  char_out <= s_ch;
end architecture rtl;
