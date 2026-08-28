-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark ;
-- Case Type: Positive
-- Test Focus: pure function with multiple params + local variables
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package fsp_pkg is
  function f_gcd(a,b:integer) return integer;
  function f_fact(n:integer) return integer;
end package;
package body fsp_pkg is
  function f_gcd(a,b:integer) return integer is
    variable x,y,t:integer;
  begin x:=a; y:=b;
    while y/=0 loop t:=y; y:=x mod y; x:=t; end loop;
    return x;
  end function;
  function f_fact(n:integer) return integer is
    variable r:integer:=1;
  begin
    for i in 2 to n loop r:=r*i; end loop;
    return r;
  end function;
end package body;
