-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_FOR_GENERATE_002
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Negative
-- Test Focus: duplicate generate label in nested scope — inner generate uses same label as outer for-generate
-- Expected Result: Triggers semantic error: duplicate label in same declarative region
-- Dependencies: None
-- =============================================================
entity fg_smn2_ent is
  generic(N:integer:=4);
  port(a:in bit_vector(N-1 downto 0); y:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_smn2_ent is
begin
  gen_dup: for i in 0 to N-1 generate
  begin
    gen_dup: for j in 0 to 0 generate
      y(i) <= a(i);
    end generate;
  end generate gen_dup;
end architecture bh;
