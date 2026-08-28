-- =============================================================
-- Case ID: TC_IDENTIFIER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Positive
-- Test Focus: Long basic_identifier with several underscore segments, used for DSP-style signal naming, verifying complex identifier parsing
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity id_long_compound is
  port (
    fir_coeff_addr    : out integer;
    dsp_pipe_stage_3  : out integer
  );
end entity id_long_compound;

architecture rtl of id_long_compound is
  constant C_FIR_TAP_COUNT  : integer := 16;
  signal accumulate_value   : integer := 0;
begin
  accumulate_value <= C_FIR_TAP_COUNT;
  fir_coeff_addr   <= accumulate_value;
  dsp_pipe_stage_3 <= accumulate_value + 1;
end architecture rtl;
