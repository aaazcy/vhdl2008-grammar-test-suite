-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: based_literal in abstract_literal missing the closing hash(#) causes parse failure: 2#1010 (only a left hash with no right hash), verify the parser triggers a syntax error on an unclosed based_literal
-- Expected Result: Triggers syntax error on unclosed based literal
-- Dependencies: None
-- =============================================================
entity al_unclosed_based is
  port (
    bad_val : out integer
  );
end entity al_unclosed_based;

architecture rtl of al_unclosed_based is
  constant C_BAD : integer := 2#1010;
begin
  bad_val <= C_BAD;
end architecture rtl;
