-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Positive
-- Test Focus: Rich entity declarative part: entity_declarative_part contains type(integer range)/subtype/constant/signal/shared variable(protected type)/function declaration+body/component declaration/attribute specification/disconnect specification/use clause, verifying all declaration item categories supported by the entity-level declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_rich is
  port(clk:in bit; val_out:out integer);
end entity;
architecture bh of edp_rich is
  type t_cnt is range 0 to 65535;
  subtype t_small is t_cnt range 0 to 255;
  constant C_MAX:t_cnt:=65535;
  signal s_cnt:t_cnt:=0;
  function f_inc(x:t_cnt) return t_cnt is begin if x<C_MAX then return x+1; else return 0; end if; end function;
  component dff is port(clk:in bit; d:in t_cnt; q:out t_cnt); end component;
  attribute style:string;
  attribute style of s_cnt:signal is "counter";
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_bus:r_bit register;
  disconnect s_bus:r_bit after 2 ns;
begin
  process(clk)
  begin
    if clk'event and clk='1' then s_cnt<=f_inc(s_cnt); end if;
  end process;
  val_out<=integer(s_cnt);
end architecture bh;
