-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Positive
-- Test Focus: Exercises signal_kind REGISTER on a guarded signal within a block statement with a guard expression.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_kind_reg is
  port (
    clk    : in  bit;
    d_in   : in  bit_vector(3 downto 0);
    q_out  : out bit_vector(3 downto 0)
  );
end entity signal_kind_reg;

architecture rtl of signal_kind_reg is
begin
  b_reg_block : block (clk = '1')
    type t_arr_4 is array (natural range <>) of bit_vector(3 downto 0);
    function f_resolve_bv(v : t_arr_4) return bit_vector is
      variable res : bit_vector(3 downto 0) := (others => '0');
    begin
      for i in v'range loop res := res or v(i); end loop;
      return res;
    end function f_resolve_bv;
    subtype r_bv4 is f_resolve_bv bit_vector(3 downto 0);
    signal s_reg : r_bv4 register;
  begin
    s_reg <= guarded d_in;
    q_out <= s_reg;
  end block b_reg_block;
end architecture rtl;
