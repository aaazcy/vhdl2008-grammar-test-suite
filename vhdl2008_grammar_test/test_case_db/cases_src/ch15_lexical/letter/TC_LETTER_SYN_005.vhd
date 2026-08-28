-- =============================================================
-- Case ID: TC_LETTER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Positive
-- Test Focus: letter as graphic_character inside extended_identifier — identifiers inside \...\ may start with an uppercase or lowercase letter
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity let_in_ext_id is
  port (
    \OutVal\ : out integer
  );
end entity let_in_ext_id;

architecture rtl of let_in_ext_id is
  signal \IntReg\ : integer := 42;
begin
  \IntReg\ <= 100;
  \OutVal\ <= \IntReg\;
end architecture rtl;
