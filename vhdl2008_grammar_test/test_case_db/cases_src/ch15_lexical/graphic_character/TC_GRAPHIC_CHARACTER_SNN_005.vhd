-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: Newline character inside a string literal — format effector is not a graphic_character, crossing a line boundary inside a string is illegal
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity gc_snn_005 is
  port (
    msg_out : out string(1 to 1)
  );
end entity gc_snn_005;

architecture rtl of gc_snn_005 is
  -- ERROR: string literal crosses line boundary
  constant C_BAD : string(1 to 1) := "
";
begin
  msg_out <= C_BAD;
end architecture rtl;
