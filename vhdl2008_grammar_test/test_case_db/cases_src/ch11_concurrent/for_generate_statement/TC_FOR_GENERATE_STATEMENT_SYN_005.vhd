-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: nested for-generate — outer loop over rows, inner loop over columns, creating 2D grid of concurrent assignments; entity fg_nest_ent
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_nest_ent is
  generic(ROWS:integer:=4; COLS:integer:=4);
  port(grid_in:in bit_vector(ROWS*COLS-1 downto 0); grid_out:out bit_vector(ROWS*COLS-1 downto 0));
end entity;
architecture bh of fg_nest_ent is
  signal s_grid:bit_vector(ROWS*COLS-1 downto 0);
begin
  gen_rows: for r in 0 to ROWS-1 generate
  begin
    gen_cols: for c in 0 to COLS-1 generate
      constant IDX:integer:=r*COLS+c;
    begin
      s_grid(IDX) <= grid_in(IDX);
      grid_out(IDX) <= s_grid(IDX);
    end generate gen_cols;
  end generate gen_rows;
end architecture bh;
