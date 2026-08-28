-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Production: signal_declaration ::= signal identifier { , identifier } : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Signal full form: multi-identifier(a,b:integer) / register kind / default aggregate(record) / bus kind / subtype_indication with range, verifying the signal_kind(register/bus) and default expression of signal_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sig_ent is
  type t_rec is record x:integer; y:bit; end record;
  type t_int_vec is array (natural range <>) of integer;
  function f_resolve_int(v : t_int_vec) return integer is
  begin
    for i in v'range loop return v(i); end loop;
    return 0;
  end function f_resolve_int;
  subtype r_int is f_resolve_int integer;
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_a,s_b:integer:=0;
  signal s_reg:r_int register:=42;
  signal s_bus:r_bit bus;
  signal s_rec:t_rec:=(x=>0,y=>'0');
begin
  process(clk) begin
    if clk'event and clk='1' then s_a<=s_a+1; s_b<=s_reg; end if;
  end process;
  y<=s_a+s_b+s_rec.x;
end architecture bh;
