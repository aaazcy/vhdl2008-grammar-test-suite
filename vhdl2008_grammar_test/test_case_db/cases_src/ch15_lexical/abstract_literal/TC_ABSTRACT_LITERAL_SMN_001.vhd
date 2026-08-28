-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: abstract_literal misused as entity name — numeric literal 123 appears in the entity identifier position instead of a legal identifier, verify semantic analysis reports an error where a name was expected but a literal was found
-- Expected Result: Triggers semantic error on literal in identifier position
-- Dependencies: None
-- =============================================================
entity 123 is
  port (
    y : out integer
  );
end entity 123;

architecture rtl of 123 is
begin
  y <= 42;
end architecture rtl;
