-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Negative
-- Test Focus: control character outside the VHDL character set appears in basic_character(DEL, neither graphic nor format_effector) — verify the lexical analyzer reports an invalid character error
-- Expected Result: Triggers syntax error on invalid character
-- Dependencies: None
-- =============================================================
entity bc_control_char is
  port (
    bad_val : out character
  );
end entity bc_control_char;

architecture rtl of bc_control_char is
  constant C_BAD : character := '';
begin
  bad_val <= C_BAD;
end architecture rtl;
