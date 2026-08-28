-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: procedure_specification ::= procedure designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] ;
-- Case Type: Positive
-- Test Focus: procedure with in/out/inout params of various types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package psp_pkg is
  procedure p_swap(a,b:inout integer);
  procedure p_set(signal s:out bit; v:in bit);
  procedure p_delay(constant d:in time);
end package;
package body psp_pkg is
  procedure p_swap(a,b:inout integer) is variable t:integer; begin t:=a;a:=b;b:=t; end;
  procedure p_set(signal s:out bit; v:in bit) is begin s<=v; end;
  procedure p_delay(constant d:in time) is begin wait for d; end;
end package body;
