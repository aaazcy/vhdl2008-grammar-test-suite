-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Negative
-- Test Focus: basic_character used as an undeclared identifier — 'X' is treated as a character literal rather than an identifier, semantically mismatched in a position requiring an identifier (such as an assignment target)
-- Expected Result: Triggers semantic error on literal where name expected
-- Dependencies: None
-- =============================================================
entity bc_literal_as_name is
  port (
    y : out integer
  );
end entity bc_literal_as_name;

architecture rtl of bc_literal_as_name is
begin
  'A' <= 65;
  y <= 42;
end architecture rtl;
