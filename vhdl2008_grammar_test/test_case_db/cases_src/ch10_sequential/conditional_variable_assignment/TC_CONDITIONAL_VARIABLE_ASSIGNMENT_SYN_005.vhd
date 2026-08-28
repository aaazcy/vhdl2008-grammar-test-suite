-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional variable assignment with boolean operators: target v_flag selects '1' or '0' via when-else according to compound boolean conditions such as a>b AND en='1', verifying the compound BOOLEAN conditions of conditional_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cva_syn5_ent is port(a,b:in integer; en:in bit; y:out bit); end entity;
architecture bh of cva_syn5_ent is signal s_res:bit:='0';
begin
  process(a,b,en)
    variable v_flag:bit;
  begin
    v_flag := '1' when a > b and en = '1' else
              '1' when a < b and en = '0' else
              '0';
    s_res <= v_flag;
    y <= s_res;
  end process;
end architecture bh;
