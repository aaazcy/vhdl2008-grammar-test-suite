-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_021
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Access types and allocators: declarative part contains an access type (pointer to a record) and an allocator (new expression), a process uses the access object to store and read data, verifying architecture_declarative_part supports access_type_definition and allocator expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_access_ent is
  port(clk:in bit; data_in:in integer; data_out:out integer);
end entity;
architecture rtl of arch_access_ent is
  type t_node is record
    val:integer;
    next_val:integer;
  end record;
  type t_node_ptr is access t_node;
  type t_pt is protected
    procedure set(v: in integer);
    impure function get return integer;
  end protected t_pt;
  type t_pt is protected body
    variable v_stored:t_node_ptr;
    procedure set(v: in integer) is
      variable tmp:t_node_ptr;
    begin
      tmp:=new t_node'(val=>v, next_val=>0);
      v_stored:=tmp;
    end procedure;
    impure function get return integer is
    begin
      if v_stored/=null then
        return v_stored.val;
      else
        return 0;
      end if;
    end function;
  end protected body t_pt;
  shared variable sv_head:t_pt;
  signal s_result:integer:=0;
begin
  process(clk)
    variable v_node:t_node_ptr;
  begin
    if clk'event and clk='1' then
      v_node:=new t_node'(val=>data_in, next_val=>0);
      sv_head.set(v_node.val);
      if sv_head.get/=0 then
        s_result<=sv_head.get;
      end if;
    end if;
  end process;
  data_out<=s_result;
end architecture rtl;
