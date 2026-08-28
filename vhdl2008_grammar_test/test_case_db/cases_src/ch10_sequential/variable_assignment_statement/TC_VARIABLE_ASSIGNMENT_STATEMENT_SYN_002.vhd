-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: variable_assignment_statement ::= [ label : ] target := expression ;
-- Case Type: Positive
-- Test Focus: Labeled variable assignment + self-referencing expression: label "l_acc" + target is variable v_acc + expression is v_acc+a (self-referencing accumulation), verifying the label and the variable's self-referencing computation in variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas2_ent is port(clk:in bit; a:in integer; y:out integer); end entity;
architecture bh of vas2_ent is signal s_res:integer:=0;
begin
  process(clk) variable v_acc:integer:=0;
  begin
    if clk'event and clk='1' then l_acc:v_acc:=v_acc+a; s_res<=v_acc; end if;
  end process;
  y<=s_res;
end architecture bh;
