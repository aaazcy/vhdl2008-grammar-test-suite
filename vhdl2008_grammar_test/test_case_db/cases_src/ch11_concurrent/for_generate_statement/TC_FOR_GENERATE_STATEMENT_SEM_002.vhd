-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_FOR_GENERATE_002
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: locally declared signal inside generate body creates independent instances per iteration — each s_local is a distinct signal, no cross-iteration interference
-- Expected Result: Compiles successfully; each s_local is scoped to its iteration
-- Dependencies: None
-- =============================================================
entity fg_sem2_ent is
  generic(N:integer:=4);
  port(a:in bit_vector(N-1 downto 0); y:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_sem2_ent is
begin
  gen_local: for i in 0 to N-1 generate
    signal s_local:bit;
  begin
    s_local <= a(i);
    y(i) <= s_local;
  end generate gen_local;
end architecture bh;
