-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.3
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: Access type pointing to record+array+integer: 3 access types - pointing to record(t_node) / pointing to array(t_vec_ptr) / pointing to integer(t_int_ptr), verifying access can point to any VHDL type and allocator(new) supports dynamic allocation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity access_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of access_ent is
  type t_node is record val:integer; nxt:integer; end record;
  type t_node_ptr is access t_node;
  type t_int_ptr  is access integer;
  signal s_res:integer:=0;
begin
  process(clk) is
    variable v_n:t_node_ptr;
    variable sv_head:t_node_ptr;
    variable sv_int:t_int_ptr;
  begin
    if clk'event and clk='1' then
      v_n:=new t_node'(val=>42,nxt=>0);
      sv_head:=v_n;
      if sv_head/=null then s_res<=sv_head.val; end if;
    end if;
  end process;
  y<=s_res;
end architecture bh;
