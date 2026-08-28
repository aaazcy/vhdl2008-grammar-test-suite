-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: with when condition: `next when cond;` — verifying that next can carry a when condition clause to conditionally skip an iteration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity next_when_cond_ent is
  port (
    data_in  : in  integer range 0 to 255;
    filtered : out integer range 0 to 255
  );
end entity next_when_cond_ent;

architecture filter of next_when_cond_ent is
  type t_buf is array (0 to 7) of integer range 0 to 255;
  signal s_samples : t_buf;
begin
  process(data_in) is
    variable v_total : integer range 0 to 2047 := 0;
    variable v_idx   : integer range 0 to 7 := 0;
  begin
    v_total := 0;
    v_idx := 0;
    loop
      next when v_idx > 7;
      v_total := v_total + s_samples(v_idx);
      v_idx := v_idx + 1;
    end loop;
    filtered <= v_total / 8;
  end process;
end architecture filter;
