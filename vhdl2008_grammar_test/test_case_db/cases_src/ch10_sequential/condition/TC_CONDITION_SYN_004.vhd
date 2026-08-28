-- =============================================================
-- Case ID: TC_CONDITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition: expression in while loop and exit when clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity condition_syn4_ent is port(go:in bit; y:out integer); end entity;
architecture bh of condition_syn4_ent is
begin
  process is
    variable v_sum:integer:=0;
  begin
    wait until go='1';
    while v_sum<100 loop
      v_sum:=v_sum+1;
      exit when v_sum>90;
    end loop;
    y<=v_sum;
  end process;
end architecture bh;
