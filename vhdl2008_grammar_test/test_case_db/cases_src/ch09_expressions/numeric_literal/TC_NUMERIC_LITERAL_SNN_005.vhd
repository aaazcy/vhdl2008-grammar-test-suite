-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Negative
-- Test Focus: SNN — based literal missing the closing #: 16#FF lacks the trailing #, a based literal must start and end with #, and must finally be closed with #
-- Expected Result: Triggers syntax error: unclosed based literal, missing closing #
-- Dependencies: None
-- =============================================================
entity num_lit_snn_005 is
  port (
    x : out integer
  );
end entity num_lit_snn_005;

architecture unclosed_based of num_lit_snn_005 is
  -- ERROR: based literal missing closing # — "16#FF" is incomplete
  constant C_BAD : integer := 16#FF;
begin
  x <= C_BAD;
end architecture unclosed_based;
