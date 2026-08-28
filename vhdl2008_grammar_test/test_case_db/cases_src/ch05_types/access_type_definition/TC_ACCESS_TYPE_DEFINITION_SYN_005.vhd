-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: access type pointing to a record type with allocator using qualified expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity atd_syn_rec is port(dout:out integer); end entity;
architecture rtl of atd_syn_rec is
  type t_point is record x:integer; y:integer; end record;
  type t_pt_ptr is access t_point;
begin process variable sv:t_pt_ptr; begin sv:=new t_point'(x=>5,y=>10); dout<=sv.x+sv.y; wait; end process; end architecture;