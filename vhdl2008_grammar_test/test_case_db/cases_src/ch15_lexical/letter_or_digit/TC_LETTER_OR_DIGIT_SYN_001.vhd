-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Positive
-- Test Focus: letter branch — all characters of the identifier except the first are letters, verify letter as a subset of letter_or_digit
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity lod_letters_only is
  port (
    data_out : out integer
  );
end entity lod_letters_only;

architecture rtl of lod_letters_only is
  signal counter : integer := 0;
begin
  counter  <= 42;
  data_out <= counter;
end architecture rtl;
