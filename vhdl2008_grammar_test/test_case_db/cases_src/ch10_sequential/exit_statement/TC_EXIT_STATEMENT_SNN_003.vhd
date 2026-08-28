-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: wrong clause order - `exit when cond loop_label;` puts when before loop_label, violating the BNF order that loop_label must precede when
-- Expected Result: Triggers syntax error: loop_label must precede 'when' clause
-- Dependencies: None
-- =============================================================
entity exit_order_err_ent is
  port (val : in integer; idx : out integer);
end entity exit_order_err_ent;

architecture err of exit_order_err_ent is
begin
  process(val) is
    variable v_i : integer := 0;
  begin
    my_loop: loop
      v_i := v_i + 1;
      exit when v_i > 5 my_loop;  -- ERROR: 'when' before loop_label
    end loop my_loop;
    idx <= v_i;
  end process;
end architecture err;
