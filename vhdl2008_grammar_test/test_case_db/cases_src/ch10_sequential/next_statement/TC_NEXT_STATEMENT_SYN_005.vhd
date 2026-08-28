-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: with statement label: `stmt_label: next when cond;` — verifying that the next statement itself can carry an optional label prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity next_stmt_label_ent is
  port (
    dividend : in  integer range 0 to 1023;
    divisor  : in  integer range 1 to 255;
    quotient : out integer range 0 to 1023
  );
end entity next_stmt_label_ent;

architecture div of next_stmt_label_ent is
begin
  process(dividend, divisor) is
    variable v_rem : integer range 0 to 1023 := 0;
    variable v_quo : integer range 0 to 1023 := 0;
  begin
    v_rem := dividend;
    v_quo := 0;
    div_loop: loop
      skip_div: next when v_rem < divisor;
      v_rem := v_rem - divisor;
      v_quo := v_quo + 1;
      next div_loop;
    end loop div_loop;
    quotient <= v_quo;
  end process;
end architecture div;
