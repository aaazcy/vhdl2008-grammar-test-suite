-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional variable assignment with label + function calls: label "l_calc" + target v_out + a 3-branch when-else, each branch expression contains the function call f_scale, verifying the label and function call combination of conditional_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cva_syn3_ent is port(mode:in integer range 0 to 2; val:in integer; y:out integer); end entity;
architecture bh of cva_syn3_ent is
  signal s_res:integer:=0;
  function f_scale(v:integer; s:integer) return integer is
  begin return v * s; end function;
begin
  process(mode,val)
    variable v_out:integer;
  begin
    l_calc: v_out := f_scale(val, 10) when mode = 0 else
                     f_scale(val, 20) when mode = 1 else
                     f_scale(val,  5);
    s_res <= v_out;
    y <= s_res;
  end process;
end architecture bh;
