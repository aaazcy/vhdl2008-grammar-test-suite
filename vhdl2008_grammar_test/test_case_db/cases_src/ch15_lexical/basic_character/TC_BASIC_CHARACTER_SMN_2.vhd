-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Negative
-- Test Focus: type mismatch of a basic_character character literal — character 'A' assigned to an integer signal, verify semantic analysis detects the character-to-integer type incompatibility error
-- Expected Result: Triggers semantic error on character-to-integer mismatch
-- Dependencies: None
-- =============================================================
entity bc_char_to_int is
  port (
    bad_val : out integer
  );
end entity bc_char_to_int;

architecture rtl of bc_char_to_int is
  constant C_CHAR : integer := 'A';
begin
  bad_val <= C_CHAR;
end architecture rtl;
