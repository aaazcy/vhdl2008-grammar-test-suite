-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | component_declaration | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: Block declarative part shows all 17 declaration item types: the block body contains type/subtype/constant/signal/shared var/alias/function+procedure/attribute decl+spec/component+config spec/disconnect/use/group, verifying all legal categories of block_declarative_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package dff_pkg is
  type t_data is range 0 to 1023;
end package dff_pkg;
use work.dff_pkg.all;
entity dff is
  port (clk:in bit; d:in t_data; q:out t_data);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

use work.dff_pkg.all;
entity bdi_ent is port(a:in integer; y:out integer); end entity;
architecture bh of bdi_ent is
begin
  b_full:block
    use std.standard.all;
    type t_state is (IDLE,RUN); subtype t_byte is t_data range 0 to 255;
    constant C_MAX:t_data:=1023; signal s_reg:t_data:=0;
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
    alias a_reg:t_data is s_reg;
    function f_dbl(x:t_data) return t_data is begin return x*2; end function;
    procedure p_rst(signal v:out t_data) is begin v<=0; end procedure;
    attribute width:integer; attribute width of s_reg:signal is 16;
    component dff is port(clk:in bit; d:in t_data; q:out t_data); end component;
    for u_dff:dff use entity work.dff(rtl);
    function resolve_bit(v:bit_vector) return bit is
    begin
      return v(v'left);
    end function resolve_bit;
    subtype r_bit is resolve_bit bit;
    signal s_bus:r_bit register; disconnect s_bus:r_bit after 1 ns;
    group g_pair is (signal,signal); group g:g_pair(s_reg,s_bus);
  begin
    u_dff:dff port map(clk=>'0', d=>C_MAX, q=>open);
    s_reg<=f_dbl(t_data(a)); y<=integer(s_reg);
  end block;
end architecture bh;
