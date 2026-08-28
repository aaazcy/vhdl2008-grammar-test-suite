-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: duplicate value of character_literal in an enumeration type definition — in type t is ('A','A') the character literal 'A' appears twice as an enumeration value, verify semantic analysis detects the duplicate enumeration literal declaration
-- Expected Result: Triggers semantic error on duplicate enumeration literal
-- Dependencies: None
-- =============================================================
entity cl_duplicate_enum is
  port (
    bad_val : out integer
  );
end entity cl_duplicate_enum;

architecture rtl of cl_duplicate_enum is
  type t_dup is ('A', 'A');
  signal s : t_dup := 'A';
begin
  bad_val <= 42;
end architecture rtl;
