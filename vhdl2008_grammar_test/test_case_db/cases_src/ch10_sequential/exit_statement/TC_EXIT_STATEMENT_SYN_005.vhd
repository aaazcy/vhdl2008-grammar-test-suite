-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: With statement label: `stmt_label: exit;` - verifying the exit statement itself can carry an optional label prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exit_stmt_label_ent is
  port (
    overflow : in  boolean;
    accum    : out integer range 0 to 255
  );
end entity exit_stmt_label_ent;

architecture accumulator of exit_stmt_label_ent is
begin
  process(overflow) is
    variable v_acc : integer range 0 to 255 := 0;
    variable v_inc : integer range 0 to 255 := 1;
  begin
    loop
      v_acc := v_acc + v_inc;
      overflow_exit: exit when v_acc > 200;
      v_inc := v_inc + 1;
      exit when v_inc > 50;
    end loop;
    accum <= v_acc;
  end process;
end architecture accumulator;
