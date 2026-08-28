-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: variable_assignment_statement ::= [ label : ] simple_variable_assignment | [ label : ] conditional_variable_assignment | [ label : ] selected_variable_assignment
-- Case Type: Positive
-- Test Focus: Accumulator pipeline: target v_acc self-referentially accumulates v_acc + din on the clock rising edge, with label "l_acc", verifying the combined use of label, self-reference, and synchronous logic in variable_assignment within a real hardware accumulator design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas_acc_ent is port(clk:in bit; din:in integer; rst:in bit; y:out integer); end entity;
architecture bh of vas_acc_ent is signal s_result:integer:=0;
begin
  process(clk, rst)
    variable v_acc:integer:=0;
  begin
    if rst = '1' then
      v_acc := 0;
    elsif clk'event and clk = '1' then
      l_acc: v_acc := v_acc + din;
      s_result <= v_acc;
    end if;
    y <= s_result;
  end process;
end architecture bh;
