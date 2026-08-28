-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: character_literal misused as a signal name identifier — attempt to declare 'X' as a signal name(signal 'X' : ...), verify semantic analysis rejects the literal appearing in the identifier position
-- Expected Result: Triggers semantic error on literal as identifier
-- Dependencies: None
-- =============================================================
entity cl_literal_as_sig is
  port (
    y : out integer
  );
end entity cl_literal_as_sig;

architecture rtl of cl_literal_as_sig is
  signal 'X' : integer := 0;
begin
  y <= 42;
end architecture rtl;
