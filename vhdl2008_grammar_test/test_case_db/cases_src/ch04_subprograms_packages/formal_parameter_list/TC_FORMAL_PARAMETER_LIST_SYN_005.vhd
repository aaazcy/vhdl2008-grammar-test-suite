-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with variable-class parameter in inout mode: variable x:inout integer, verification of inout bidirectional parameter of variable interface class
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_var_ent is port(a:in integer; y:out integer); end entity;
architecture bh of fpl_var_ent is
  procedure p_dbl(variable v:inout integer) is
  begin v:=v*2; end procedure;
begin
  process(a)
    variable v_tmp:integer;
  begin
    v_tmp:=a;
    p_dbl(v_tmp);
    y<=v_tmp;
  end process;
end architecture bh;
