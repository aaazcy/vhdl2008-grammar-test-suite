-- =============================================================
-- Case ID: TC_SIGN_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Negative
-- Test Focus: SNN: missing the term on the right of sign — the expression "-" is directly followed by a semicolon with no term, verifying that in BNF simple_expression ::= [ sign ] term the term on the right of sign cannot be omitted
-- Expected Result: Triggers syntax error: missing term after sign
-- Dependencies: None
-- =============================================================
entity ent_snn_no_term is
  port (
    y_o : out integer
  );
end entity ent_snn_no_term;

architecture rtl of ent_snn_no_term is
begin
  -- ERROR: missing term after sign "-"
  y_o <= - ;
end architecture rtl;
