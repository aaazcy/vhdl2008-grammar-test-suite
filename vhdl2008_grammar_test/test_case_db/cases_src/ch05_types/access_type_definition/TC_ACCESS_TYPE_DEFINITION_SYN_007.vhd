-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: access type used to build a linked list of records (two-node chain)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity atd_syn_linked_list is port(dout:out integer); end entity;
architecture rtl of atd_syn_linked_list is
  type t_node; type t_node_ptr is access t_node;
  type t_node is record val:integer; nxt:t_node_ptr; end record;
begin process variable a,b:t_node_ptr; variable sv_head:t_node_ptr; begin
  a:=new t_node'(val=>100,nxt=>null);
  b:=new t_node'(val=>200,nxt=>a);
  sv_head:=b;
  if sv_head/=null then dout<=sv_head.val; end if; wait; end process; end architecture;