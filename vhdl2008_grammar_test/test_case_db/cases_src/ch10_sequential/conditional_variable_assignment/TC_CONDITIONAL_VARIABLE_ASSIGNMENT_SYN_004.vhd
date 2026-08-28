-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional variable assignment in register loading: on the clock rising edge, v_reg loads a new value or holds according to the load_en condition, verifying the when-else conditional load pattern of conditional_variable_assignment in a real hardware register
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cva_syn4_ent is port(clk:in bit; load_en:in bit; din:in integer; y:out integer); end entity;
architecture bh of cva_syn4_ent is signal s_q:integer:=0;
begin
  process(clk)
    variable v_reg:integer:=0;
  begin
    if clk'event and clk = '1' then
      v_reg := din when load_en = '1' else v_reg;
      s_q <= v_reg;
    end if;
    y <= s_q;
  end process;
end architecture bh;
