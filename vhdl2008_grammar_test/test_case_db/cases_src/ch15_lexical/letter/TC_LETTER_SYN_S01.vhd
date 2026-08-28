-- =============================================================
-- Case ID: TC_LETTER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: LETTER
-- IEEE Section: 15.3
-- BNF Text: letter ::= upper_case_letter | lower_case_letter
-- Test Focus: Upper-case letters as the first character of basic identifiers for entity and architecture names
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity letter_syn_s01 is
  port (
    A_input  : in  bit;
    B_input  : in  bit;
    Y_output : out bit
  );
end entity letter_syn_s01;

architecture RTL of letter_syn_s01 is
  -- All identifiers start with a letter (upper_case_letter here)
  signal AndGate : bit;
  signal OrGate  : bit;
begin
  AndGate <= A_input and B_input;
  OrGate  <= A_input or B_input;
  Y_output <= AndGate xor OrGate;
end architecture RTL;
