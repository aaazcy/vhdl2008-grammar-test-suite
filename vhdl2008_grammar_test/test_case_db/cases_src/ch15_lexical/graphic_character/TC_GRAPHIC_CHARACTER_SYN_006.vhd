-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Positive
-- Test Focus: Operator characters (+ - * / = < >) appearing as graphic_character in strings, verifying the operator symbol subcategory
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity gc_operator_chars is
  port (
    msg_out : out string(1 to 10)
  );
end entity gc_operator_chars;

architecture rtl of gc_operator_chars is
  constant C_OPS : string(1 to 10) := "+-*/=<>|&.";
begin
  msg_out <= C_OPS;
end architecture rtl;
