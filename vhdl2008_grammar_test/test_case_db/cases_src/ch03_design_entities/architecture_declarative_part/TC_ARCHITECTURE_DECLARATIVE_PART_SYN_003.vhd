-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Signal + constant + file + shared variable declarations: declarative part contains signal (with register kind + default value aggregate)/constant (integer+time+bit_vector)/file type + file declaration/shared variable (with protected type), verifying all object declaration categories: signal/constant/file/shared_variable
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_objects_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of adp_objects_ent is
  type t_data is range 0 to 65535;
  constant C_MAX:t_data:=65535;
  constant C_DLY:time:=10 ns;
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_cnt:t_data:=0;
  signal s_bus:r_bit register;
  signal s_arr:bit_vector(7 downto 0):=(others=>'0');
  type t_int_file is file of integer;
  type t_prot is protected
    procedure inc; impure function val return integer;
  end protected;
  type t_prot is protected body
    variable v:integer:=0;
    procedure inc is begin v:=v+1; end procedure;
    impure function val return integer is begin return v; end function;
  end protected body;
  shared variable sv_ctr:t_prot;
begin
  process(clk) begin
    if clk'event and clk='1' then sv_ctr.inc; s_cnt<=t_data(sv_ctr.val); end if;
  end process;
  y<=integer(s_cnt);
end architecture bh;
