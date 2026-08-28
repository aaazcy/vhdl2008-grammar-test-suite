-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Positive
-- Test Focus: Validates that BUS-kind signals correctly resolve multiple drivers using the default resolution function (disconnection).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_kind_sem01 is
  port (
    ctrl_a : in  bit;
    ctrl_b : in  bit;
    val_a  : in  bit_vector(7 downto 0);
    val_b  : in  bit_vector(7 downto 0);
    result : out bit_vector(7 downto 0)
  );
end entity signal_kind_sem01;

architecture rtl of signal_kind_sem01 is
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
  b1 : block (ctrl_a = '1')
  begin
    s_bus <= guarded val_a;
  end block b1;
  b2 : block (ctrl_b = '1')
  begin
    s_bus <= guarded val_b;
  end block b2;
  result <= s_bus;
end architecture rtl;
