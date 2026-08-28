-- =============================================================
-- Case ID: TC_LETTER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Positive
-- Test Focus: Full alphabet coverage — letters from A to Z and a to z used in attribute names and port names, verifying the complete letter set
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity let_full_abc is
  port (
    Apple  : out integer;
    Zebra  : out integer;
    alpha  : out integer;
    omega  : out integer
  );
end entity let_full_abc;

architecture rtl of let_full_abc is
  constant C_Base : integer := 0;
begin
  Apple <= C_Base;
  Zebra <= C_Base + 1;
  alpha <= C_Base + 2;
  omega <= C_Base + 3;
end architecture rtl;
