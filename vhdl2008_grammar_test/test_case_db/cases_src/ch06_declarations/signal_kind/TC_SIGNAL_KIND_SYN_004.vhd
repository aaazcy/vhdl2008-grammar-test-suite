-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Positive
-- Test Focus: Combines both REGISTER and BUS signal kinds in one design with guarded assignments and disconnection specification.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_kind_dual is
  port (
    clk    : in  bit;
    en     : in  bit;
    data   : in  bit_vector(7 downto 0);
    q_reg  : out bit_vector(7 downto 0);
    q_bus  : out bit_vector(7 downto 0)
  );
end entity signal_kind_dual;

architecture rtl of signal_kind_dual is
  type t_arr_8 is array (natural range <>) of bit_vector(7 downto 0);
  function f_resolve_bv(v : t_arr_8) return bit_vector is
    variable res : bit_vector(7 downto 0) := (others => '0');
  begin
    for i in v'range loop res := res or v(i); end loop;
    return res;
  end function f_resolve_bv;
  subtype r_bv8 is f_resolve_bv bit_vector(7 downto 0);
  signal s_reg : r_bv8 register;
  signal s_bus : r_bv8 bus;
  disconnect s_bus : r_bv8 after 5 ns;
begin
  b_reg_block : block (clk = '1' and clk'event)
  begin
    s_reg <= guarded data;
  end block b_reg_block;

  b_bus_block : block (en = '1')
  begin
    s_bus <= guarded data;
  end block b_bus_block;

  q_reg <= s_reg;
  q_bus <= s_bus;
end architecture rtl;
