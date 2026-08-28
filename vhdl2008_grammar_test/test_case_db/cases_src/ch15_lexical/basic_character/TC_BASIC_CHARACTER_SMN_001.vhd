-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Negative
-- Test Focus: SMN: character literal is empty — in constant C_BAD : character := '' there is no basic_character between the two single quotes, a character literal must contain one character
-- Expected Result: Triggers analysis error: empty quote is not allowed in vhdl
-- Dependencies: None
-- =============================================================
entity bc_empty_char is
  port (
    y : out character
  );
end entity bc_empty_char;

architecture vhdl2008 of bc_empty_char is
  constant C_BAD : character := '';
begin
  y <= C_BAD;
end architecture vhdl2008;
