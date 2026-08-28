-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark ;
-- Case Type: Positive
-- Test Focus: function with array parameter and return
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package fsp_pkg3 is
  type t_vec is array(0 to 7) of integer;
  function f_vec_sum(a:t_vec) return integer;
  function f_vec_max(a:t_vec) return integer;
end package;
package body fsp_pkg3 is
  function f_vec_sum(a:t_vec) return integer is
    variable s:integer:=0;
  begin for i in a'range loop s:=s+a(i); end loop; return s; end;
  function f_vec_max(a:t_vec) return integer is
    variable m:integer:=a(0);
  begin for i in a'range loop if a(i)>m then m:=a(i); end if; end loop; return m; end;
end package body;
