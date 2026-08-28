-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Positive
-- Test Focus: character_literal digit character forms('0', '9') — digit class graphic_characters inside single quotes as character literals, verify digit character literals are legal in case/cmp contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cl_digit_literals is
  port (
    zero : out character;
    nine : out character
  );
end entity cl_digit_literals;

architecture rtl of cl_digit_literals is
begin
  zero <= '0';
  nine <= '9';
end architecture rtl;
