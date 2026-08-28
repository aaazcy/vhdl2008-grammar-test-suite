-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Positive
-- Test Focus: DSP-style identifiers — stage numbers, channel numbers and width suffixes using digits, comprehensively test complex combinations of letter_or_digit in real RTL
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity lod_dsp_style is
  port (
    fir_tap15_coeff  : out integer;
    fft_stage3_radix4 : out integer;
    i2c_addr7bit     : out integer
  );
end entity lod_dsp_style;

architecture rtl of lod_dsp_style is
  signal mac_result48bit : integer := 0;
  signal acc_reg32       : integer := 0;
begin
  mac_result48bit <= 2048;
  acc_reg32       <= mac_result48bit / 64;
  fir_tap15_coeff <= acc_reg32;
  fft_stage3_radix4 <= 16;
  i2c_addr7bit    <= 127;
end architecture rtl;
