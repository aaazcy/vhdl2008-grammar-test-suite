-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: character_literal assigned to an incompatible type — character literal 'X' assigned to an integer signal, verify the semantic type check detects the character-to-integer type mismatch error
-- Expected Result: Triggers semantic error on type mismatch
-- Dependencies: None
-- =============================================================
entity cl_type_mismatch is
  port (
    bad_val : out integer
  );
end entity cl_type_mismatch;

architecture rtl of cl_type_mismatch is
  constant C_CH : integer := 'X';
begin
  bad_val <= C_CH;
end architecture rtl;
