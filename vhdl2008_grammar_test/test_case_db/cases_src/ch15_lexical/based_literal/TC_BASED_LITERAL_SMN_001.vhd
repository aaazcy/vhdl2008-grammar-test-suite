-- =============================================================
-- Case ID: TC_BASED_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Negative
-- Test Focus: based_literal used in a context requiring an identifier — attempt to use 2#1# as an entity name: verify semantic analysis rejects the literal appearing in the identifier position
-- Expected Result: Triggers semantic error on literal as identifier
-- Dependencies: None
-- =============================================================
entity 2#1# is
  port (
    y : out integer
  );
end entity 2#1#;

architecture rtl of 2#1# is
begin
  y <= 42;
end architecture rtl;
