-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: generate label collision — two for-generate statements with identical label in same declarative region
-- Expected Result: Triggers semantic error: duplicate generate label
-- Dependencies: None
-- =============================================================
entity fg_snn6_ent is port(y:out bit_vector(3 downto 0)); end entity;
architecture bh of fg_snn6_ent is
  signal a:bit_vector(3 downto 0):="0000";
begin
  gen_dup: for i in 0 to 1 generate
    y(i) <= a(i);
  end generate;
  gen_dup: for i in 2 to 3 generate
    y(i) <= a(i);
  end generate;
end architecture bh;
