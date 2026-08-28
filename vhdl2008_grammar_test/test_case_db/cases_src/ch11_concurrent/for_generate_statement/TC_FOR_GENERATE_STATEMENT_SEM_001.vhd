-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_FOR_GENERATE_001
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: generate parameter i is accessible within its own iteration scope — each iteration reads its own i value correctly, driving the expected bit position
-- Expected Result: Compiles successfully; each iteration's i maps to the correct array index
-- Dependencies: None
-- =============================================================
entity fg_sem1_ent is
  generic(N:integer:=8);
  port(a:in bit_vector(N-1 downto 0); y:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_sem1_ent is
begin
  gen_scope: for i in 0 to N-1 generate
    y(i) <= a(i);
  end generate gen_scope;
end architecture bh;
