-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with record type parameter: pt:in t_point, verification of user-defined record as parameter type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_record_ent is port(x,y:in integer; r:out integer); end entity;
architecture bh of fpl_record_ent is
  type t_point is record
    px,py:integer;
  end record;
  function f_dist(a:t_point; b:t_point) return integer is
  begin return abs(a.px-b.px)+abs(a.py-b.py); end function;
  signal s_a,s_b:t_point;
begin
  s_a<=(px=>x,py=>0); s_b<=(px=>0,py=>y);
  r<=f_dist(s_a,s_b);
end architecture bh;
