-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Positive
-- Test Focus: Exercises signal_kind BUS with multiple drivers resolved through a guarded block statement.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_kind_bus is
  port (
    sel    : in  bit;
    a_in   : in  bit_vector(7 downto 0);
    b_in   : in  bit_vector(7 downto 0);
    y_out  : out bit_vector(7 downto 0)
  );
end entity signal_kind_bus;

architecture rtl of signal_kind_bus is
  type t_arr_8 is array (natural range <>) of bit_vector(7 downto 0);
  function f_resolve_bv(v : t_arr_8) return bit_vector is
    variable res : bit_vector(7 downto 0) := (others => '0');
  begin
    for i in v'range loop res := res or v(i); end loop;
    return res;
  end function f_resolve_bv;
  subtype r_bv8 is f_resolve_bv bit_vector(7 downto 0);
  signal s_bus : r_bv8 bus;
begin
  b_drv_a : block (sel = '0')
  begin
    s_bus <= guarded a_in;
  end block b_drv_a;

  b_drv_b : block (sel = '1')
  begin
    s_bus <= guarded b_in;
  end block b_drv_b;

  y_out <= s_bus;
end architecture rtl;
