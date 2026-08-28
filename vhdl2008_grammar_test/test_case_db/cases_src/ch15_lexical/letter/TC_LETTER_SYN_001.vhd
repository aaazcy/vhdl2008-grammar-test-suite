-- =============================================================
-- Case ID: TC_LETTER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Positive
-- Test Focus: Uppercase letter as first character of an identifier — testing the upper_case_letter branch, all identifiers must start with letter
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity let_upper_only is
  port (
    ValOut : out integer
  );
end entity let_upper_only;

architecture rtl of let_upper_only is
  constant C_MAX : integer := 255;
  signal SigBuf  : integer := 0;
begin
  SigBuf <= C_MAX;
  ValOut <= SigBuf;
end architecture rtl;
