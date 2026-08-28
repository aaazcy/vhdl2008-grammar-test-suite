-- =============================================================
-- Case ID: TC_INTERFACE_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Production: interface_list ::= interface_element { ; interface_element }
-- Case Type: Positive
-- Test Focus: Interface list with all interface classes: the formal_parameter_list of a procedure contains three kinds of interface_object_declaration - constant in / signal out / variable inout, separated by semicolons, verifying interface_list can mix multiple interface classes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity il_ent is port(a:in integer; y:out integer); end entity;
architecture bh of il_ent is
  procedure p_mix(
    constant c_in : in  integer;
    signal   s_out: out integer;
    variable v_io : inout integer) is
  begin s_out<=c_in+v_io; v_io:=v_io+1; end procedure;
  signal s_res:integer:=0;
begin
  process(a) variable v_acc:integer:=0; begin
    p_mix(a,s_res,v_acc);
    y<=s_res;
  end process;
end architecture bh;
