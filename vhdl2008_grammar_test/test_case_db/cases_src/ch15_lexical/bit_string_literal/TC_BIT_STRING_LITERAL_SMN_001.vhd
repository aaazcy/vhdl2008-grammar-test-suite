-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: bit_string_literal used as an entity name(X"FF") — a bit string literal cannot serve as a design unit identifier, verify semantic analysis detects the illegal use of a bit string literal in place of an identifier
-- Expected Result: Triggers semantic error on bit string as identifier
-- Dependencies: None
-- =============================================================
entity X"FF" is
  port (
    y : out integer
  );
end entity X"FF";

architecture rtl of X"FF" is
begin
  y <= 42;
end architecture rtl;
