-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Positive
-- Test Focus: format_effector of basic_character, horizontal tab(HT) and line feed(LF), appearing in string literals — VHDL allows format_effector as basic_character in comments/strings
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bc_format_effectors is
  port (
    msg : out string(1 to 4)
  );
end entity bc_format_effectors;

architecture rtl of bc_format_effectors is
  constant C_MSG : string(1 to 4) := "OK" & HT & LF;
begin
  msg <= C_MSG;
end architecture rtl;
