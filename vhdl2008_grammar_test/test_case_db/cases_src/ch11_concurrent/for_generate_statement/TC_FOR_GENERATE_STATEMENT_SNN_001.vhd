-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: missing "for" keyword — generate_label : <MISSING for> i in 0 to 3 generate ...
-- Expected Result: Triggers syntax error: missing "for"
-- Dependencies: None
-- =============================================================
entity fg_snn1_ent is port(y:out bit_vector(3 downto 0)); end entity;
architecture bh of fg_snn1_ent is
  signal a:bit_vector(3 downto 0):="0000";
begin
  gen_bad: i in 0 to 3 generate
    y(i) <= a(i);
  end generate;
end architecture bh;
