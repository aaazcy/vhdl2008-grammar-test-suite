-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Component + configuration specification + disconnection specification + use clause: declarative part contains component declaration (with generic+port)/configuration specification (for...use entity...port map)/disconnection specification (disconnect signal after time)/use clause (with .all), verifying block-specific declarative item categories
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  generic (Tpd:time:=1 ns);
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity adp_cfg_ent is port(a,b:in bit; y:out bit); end entity;
architecture bh of adp_cfg_ent is
  use std.standard.all;
  component and2 is generic(Tpd:time:=1 ns); port(x1,x2:in bit; z:out bit); end component;
  for u_and:and2 use entity work.and2(rtl) generic map(Tpd=>500 ps) port map(x1=>x1,x2=>x2,z=>z);
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_bus:r_bit register;
  disconnect s_bus:r_bit after 2 ns;
  signal s_and:bit;
begin
  u_and:and2 generic map(Tpd=>1 ns) port map(x1=>a,x2=>b,z=>s_and);
  y<=s_and;
end architecture bh;
