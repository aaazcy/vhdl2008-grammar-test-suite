-- =============================================================
-- Case ID: TC_STRING_LITERAL_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: String type confused with character type — assigning string_literal to a character type signal, type mismatch
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity str_sem_002 is
  port (
    char_out : out character
  );
end entity str_sem_002;

architecture rtl of str_sem_002 is
  constant C_BAD : character := "AB";
begin
  char_out <= C_BAD;
end architecture rtl;
