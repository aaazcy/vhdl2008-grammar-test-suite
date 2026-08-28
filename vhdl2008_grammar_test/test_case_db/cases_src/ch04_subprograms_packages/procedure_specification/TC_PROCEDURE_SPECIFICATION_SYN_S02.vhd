-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: procedure_specification ::= procedure designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] ;
-- Case Type: Positive
-- Test Focus: procedure with array and record parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package psp_pkg2 is
  type t_arr is array(0 to 7) of integer;
  type t_pt is record x,y:integer; end record;
  procedure p_fill(signal a:out t_arr; v:in integer);
  procedure p_move(signal p:inout t_pt; dx,dy:in integer);
end package;
package body psp_pkg2 is
  procedure p_fill(signal a:out t_arr; v:in integer) is begin for i in a'range loop a(i)<=v; end loop; end;
  procedure p_move(signal p:inout t_pt; dx,dy:in integer) is begin p.x<=p.x+dx; p.y<=p.y+dy; end;
end package body;
