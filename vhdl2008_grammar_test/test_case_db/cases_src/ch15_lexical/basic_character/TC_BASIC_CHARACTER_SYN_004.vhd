-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Positive
-- Test Focus: special characters of basic_character('+', '-', '*', '/') used as character literals in an operator-parsing context: verify the special_character class is legal in character constant assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bc_special_chars is
  port (
    op1 : out character;
    op2 : out character;
    op3 : out character;
    op4 : out character
  );
end entity bc_special_chars;

architecture rtl of bc_special_chars is
begin
  op1 <= '+';
  op2 <= '-';
  op3 <= '*';
  op4 <= '/';
end architecture rtl;
