-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Positive
-- Test Focus: letter and digit mixed in identifiers — underscore separators followed by digits, verify the alternating use of the two forms of letter_or_digit
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity lod_mixed_ids is
  port (
    ch0_data   : out integer;
    ch1_valid  : out bit;
    phase3_clk : out bit
  );
end entity lod_mixed_ids;

architecture rtl of lod_mixed_ids is
  signal pipe0_out : integer := 0;
  signal pipe1_out : integer := 10;
  signal valid_s1  : bit := '0';
begin
  pipe0_out  <= pipe1_out;
  ch0_data   <= pipe0_out;
  ch1_valid  <= valid_s1;
  phase3_clk <= '1';
end architecture rtl;
