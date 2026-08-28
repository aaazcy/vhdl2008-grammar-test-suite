-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: function_specification returning a record type: function returns a custom record type, verifies the composite return type of the function branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ss_record_ent is port(x,y:in integer; r:out integer); end entity;
architecture bh of ss_record_ent is
  type t_point is record
    a,b:integer;
  end record;
  function f_make_pt(ax,ay:integer) return t_point is
    variable pt:t_point;
  begin
    pt.a:=ax; pt.b:=ay;
    return pt;
  end function;
begin
  r<=f_make_pt(x,y).a+f_make_pt(x,y).b;
end architecture bh;
