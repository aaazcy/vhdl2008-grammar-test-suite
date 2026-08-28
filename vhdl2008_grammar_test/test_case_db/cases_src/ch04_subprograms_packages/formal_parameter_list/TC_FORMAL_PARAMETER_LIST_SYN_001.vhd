-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2
-- Production: formal_parameter_list ::= interface_declaration { ; interface_declaration }
-- Case Type: Positive
-- Test Focus: Formal parameters with all classes+modes: constant in/signal out/variable inout/file parameters, semicolon separated, with default values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_ent is port(a:in integer; y:out integer); end entity;
architecture bh of fpl_ent is
  procedure p_full(
    constant c_in : in  integer:=0;
    signal   s_out: out integer;
    variable v_io : inout integer) is
  begin s_out<=c_in+v_io; v_io:=v_io+1; end procedure;
  signal s_res:integer:=0;
begin
  process(a) variable v_acc:integer:=0; begin p_full(a,s_res,v_acc); y<=s_res; end process;
end architecture bh;
