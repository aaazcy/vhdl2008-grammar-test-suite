-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SEM_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_FOR_GENERATE_003
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: nested for-generate correctly resolves inner and outer generate parameters — outer r and inner c are both accessible within innermost scope
-- Expected Result: Compiles successfully; both generate parameters resolve correctly
-- Dependencies: None
-- =============================================================
entity fg_sem3_ent is
  generic(ROWS:integer:=2; COLS:integer:=2);
  port(a:in bit_vector(ROWS*COLS-1 downto 0); y:out bit_vector(ROWS*COLS-1 downto 0));
end entity;
architecture bh of fg_sem3_ent is
begin
  gen_outer: for r in 0 to ROWS-1 generate
  begin
    gen_inner: for c in 0 to COLS-1 generate
      constant IDX:integer:=r*COLS+c;
    begin
      y(IDX) <= a(IDX);
    end generate gen_inner;
  end generate gen_outer;
end architecture bh;
