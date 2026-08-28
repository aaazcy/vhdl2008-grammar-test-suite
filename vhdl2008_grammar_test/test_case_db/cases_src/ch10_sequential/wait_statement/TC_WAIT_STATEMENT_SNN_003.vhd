-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Negative
-- Test Focus: SNN: Wrong clause order — `wait until cond on sig;` places until before on, violating the on -> until -> for order required by the BNF
-- Expected Result: Triggers syntax error: clauses in wrong order, 'on' must precede 'until'
-- Dependencies: None
-- =============================================================
entity wait_order_err_ent is
  port (clk : in bit; data : in bit; result : out bit);
end entity wait_order_err_ent;

architecture err of wait_order_err_ent is
begin
  process is
  begin
    wait until data = '1' on clk;  -- ERROR: until before on (wrong order)
    result <= clk;
    wait;
  end process;
end architecture err;
