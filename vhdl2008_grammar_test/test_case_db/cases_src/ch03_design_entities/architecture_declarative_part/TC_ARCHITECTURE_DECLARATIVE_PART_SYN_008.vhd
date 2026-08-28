-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Comprehensive all declaration items: 15 kinds of block_declarative_item all appear in one declarative part - type+subtype+constant+signal+shared var+file+alias+function+procedure+attribute decl+attribute spec+component+config spec+disconnect+use+group, verifying the full capacity of the architecture declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  port (clk:in bit; d:in integer; q:out integer);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity adp_full_ent is port(clk:in bit; a:in integer; y:out integer); end entity;
architecture bh of adp_full_ent is
  use std.standard.all;
  type t_data is range 0 to 65535; subtype t_byte is t_data range 0 to 255;
  constant C_MAX:t_data:=65535;
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_cnt:t_data:=0; signal s_bus:r_bit register;
  type t_cnt_prot is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_cnt_prot is protected body
    variable v:integer:=0;
    procedure inc is begin v:=v+1; end procedure;
    impure function get return integer is begin return v; end function;
  end protected body;
  shared variable sv_id:t_cnt_prot;
  type t_int_file is file of integer;
  alias a_cnt:t_data is s_cnt;
  function f_inc(x:t_data) return t_data is begin if x<C_MAX then return x+1; else return 0; end if; end function;
  procedure p_rst(signal v:out t_data) is begin v<=0; end procedure;
  attribute width:integer; attribute width of s_cnt:signal is 16;
  component dff is port(clk:in bit; d:in integer; q:out integer); end component;
  for u_dff:dff use entity work.dff(rtl);
  disconnect s_bus:r_bit after 1 ns;
  group cnt_sigs is (signal, signal); group g_cnt:cnt_sigs(s_cnt,s_bus);
begin
  u_dff:dff port map(clk=>clk, d=>a, q=>open);
  process(clk) begin if clk'event and clk='1' then s_cnt<=f_inc(s_cnt); end if; end process;
  y<=integer(s_cnt);
end architecture bh;
