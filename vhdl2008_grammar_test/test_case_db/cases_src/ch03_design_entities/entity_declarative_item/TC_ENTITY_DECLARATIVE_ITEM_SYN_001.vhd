-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= subprogram_declaration | subprogram_body | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: All 15 entity_declarative_item kinds shown together: the entity declarative part contains type/subtype/constant/signal/shared var/file/alias/function decl+body/attribute decl+spec/disconnect/use/group template+decl, verifying all entity declaration item categories are legal in the entity-level declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_full_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of edi_full_ent is
  use std.standard.all;
  type t_data is range 0 to 1023; subtype t_byte is t_data range 0 to 255;
  constant C_DEF:t_data:=512; signal s_reg:t_data:=C_DEF;
  type t_pt is protected
    procedure set_id(v:in integer);
    impure function get_id return integer;
  end protected t_pt;
  type t_pt is protected body
    variable v_id:integer:=0;
    procedure set_id(v:in integer) is begin v_id:=v; end procedure;
    impure function get_id return integer is begin return v_id; end function;
  end protected body t_pt;
  shared variable sv_id:t_pt;
  type t_int_file is file of integer;
  alias a_reg:t_data is s_reg;
  function f_dbl(x:t_data) return t_data is begin return x*2; end function;
  attribute width:integer; attribute width of s_reg:signal is 16;
  function resolve_bit(v:bit_vector) return bit is
  begin
    return v(v'left);
  end function resolve_bit;
  subtype r_bit is resolve_bit bit;
  signal s_bus:r_bit register; disconnect s_bus:r_bit after 1 ns;
  group sig_pair is (signal,signal); group g_pair:sig_pair(s_reg,s_bus);
begin
  process(clk) begin if clk'event and clk='1' then s_reg<=f_dbl(t_data(128)); end if; end process;
  y<=integer(s_reg);
end architecture bh;
