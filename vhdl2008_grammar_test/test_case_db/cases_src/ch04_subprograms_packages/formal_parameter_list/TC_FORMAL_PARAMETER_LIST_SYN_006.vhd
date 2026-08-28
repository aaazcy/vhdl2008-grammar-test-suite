-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with mixed three interface classes: constant in + signal out + variable inout, verification of interface class diversity within the parameter list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_mixed_ent is port(clk:in bit; a:in integer; y:out integer); end entity;
architecture bh of fpl_mixed_ent is
  procedure p_proc(
    constant c:in integer;
    signal s:out integer;
    variable v:inout integer) is
  begin
    s<=c+v;
    v:=v+1;
  end procedure;
  signal s_res:integer:=0;
begin
  process(clk)
    variable v_acc:integer:=0;
  begin
    if clk'event and clk='1' then
      p_proc(a,s_res,v_acc);
    end if;
  end process;
  y<=s_res;
end architecture bh;
